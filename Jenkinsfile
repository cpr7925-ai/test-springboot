pipeline {
    agent any

    tools {
        maven 'Maven3'
        jdk 'JDK17'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Archive jar') {
            steps {
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }

        stage('Docker Build') {
            steps {
                bat 'docker build -t my-springboot-app:latest .'
            }
        }

        stage('Docker Run (Local)') {
            steps {
                bat '''
                docker stop my-springboot-app || exit 0
                docker rm my-springboot-app || exit 0
                docker run -d --name my-springboot-app -p 8082:8082 my-springboot-app:latest
                '''
            }
        }
    }
}
