pipeline {
    agent any
    tools {
        maven 'Maven 3.9.9'
        jdk 'Java 21' // Updated to Java 17 for consistency with Dockerfile and pom.xml
    }
    environment {
        IMAGE_NAME = "aymenardo/train-reservation:${BUILD_NUMBER}"
        ARTIFACT_VERSION = "1.0-${BUILD_NUMBER}" // Define a version for the artifact
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
       stage('Deploy to Nexus') {
            steps {
                bat "mvn deploy:deploy-file -DgroupId=com.aymenardo -DartifactId=train-reservation -Dversion=${ARTIFACT_VERSION} -Dpackaging=war -Dfile=target/TrainTicketReservationSystem.war -DrepositoryId=nexus-releases -Durl=http://localhost:8082/repository/train-reservation-releases/"
            }
        }
        stage('Build Docker Image') {
            steps {
                // Download the artifact from Nexus
                bat "curl -u admin:ardouni2003 -O http://localhost:8082/repository/train-reservation-releases/com/aymenardo/train-reservation/${ARTIFACT_VERSION}/train-reservation-${ARTIFACT_VERSION}.war"
                // Move the downloaded .war file to the expected location
                bat "move train-reservation-${ARTIFACT_VERSION}.war target/TrainTicketReservationSystem.war"
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
