pipeline {
    agent any

    tools {
        maven 'Maven 3.9.9' 
        jdk 'Java 21'      
    }

    stages {
        stage('Clone') {
            steps {
                git url: 'https://github.com/Aymenardo/train-reservation.git', credentialsId: 'github-pat'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
    }
}
