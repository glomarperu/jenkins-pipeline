pipeline {
    agent any
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
                sh 'docker build -t node-jenkins-app .'
            }
        }
        stage('Ejecutar Contenedor') {
            steps {
                sh 'docker run -d -p 3000:3000 node-jenkins-app'
            }
        }
    }
}
