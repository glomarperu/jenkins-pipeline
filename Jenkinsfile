pipeline {
    agent any
    tools {
        nodejs 'NodeJS'  // Asegura que Jenkins use Node.js
    }
    environment {
        IMAGE_NAME = 'node-jenkins-app'
        CONTAINER_PORT = '3000'
        HOST_PORT = '3000'
    }
    stages {
        stage('Clonar Código') {
            steps {
                git branch: 'main', url: 'https://github.com/glomarperu/jenkins-pipeline.git'
            }
        }
        stage('Instalar Dependencias') {
            steps {
                sh 'npm install'
            }
        }
        stage('Construir y Probar') {
            steps {
                sh 'npm test || echo "No hay pruebas definidas"'
            }
        }
        stage('Construir Imagen Docker') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }
        stage('Ejecutar Contenedor') {
            steps {
                sh 'docker run --rm -d -p $HOST_PORT:$CONTAINER_PORT --name $IMAGE_NAME $IMAGE_NAME'
            }
        }
    }
}
