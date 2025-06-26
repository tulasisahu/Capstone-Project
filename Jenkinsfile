pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "mywebapp:${BUILD_ID}"
        PROD_SERVER = "ec2-user@10.0.1.226"  // Replace with your actual prod server IP
    }
    triggers {
        githubPush()
    }
    stages {
        stage('Build') {
            steps {
                sh "docker build -t $DOCKER_IMAGE ./webapp"
            }
        }

        stage('Test') {
            steps {
                echo 'Testing completed (add test commands here if needed)'
            }
        }

        stage('Deploy to Prod') {
            when {
                branch 'main'
            }
            steps {
                sshagent(['jenkins-prod-key-id']) { // Replace with your Jenkins credentials ID
                    sh """
                        docker save $DOCKER_IMAGE | bzip2 | ssh $PROD_SERVER 'bunzip2 | docker load'
                        ssh $PROD_SERVER "docker stop webapp || true && docker rm webapp || true"
                        ssh $PROD_SERVER "docker run -d --name webapp -p 80:80 $DOCKER_IMAGE"
                    """
                }
            }
        }
    }
}

