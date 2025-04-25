pipeline {
    agent any

    tools {
        maven 'Maven 3.9.9'
        jdk 'Java 21'
    }

    environment {
        DOCKERHUB_CREDENTIALS = credentials('aymen2003')
        IMAGE_NAME = "${DOCKERHUB_CREDENTIALS_USR}/train-reservation:${BUILD_NUMBER}"
    }

    stages {
        stage('Clone') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Aymenardo/train-reservation.git',
                    credentialsId: 'github-pat'
            }
        }

        stage('Build') {
            steps {
                bat 'mvn clean compile'
            }
        }

        stage('Test') {
            steps {
                bat 'mvn test'
            }
        }

        stage('Package') {
            steps {
                bat 'mvn package'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Login to Docker Hub') {
            steps {
                bat "echo %DOCKERHUB_CREDENTIALS_PSW% | docker login -u %DOCKERHUB_CREDENTIALS_USR% --password-stdin"
            }
        }

        stage('Push Docker Image') {
            steps {
                bat "docker push ${IMAGE_NAME}"
            }
        }
    }

    post {
        always {
            bat 'docker logout'
        }
    }
}
