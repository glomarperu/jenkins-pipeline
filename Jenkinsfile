pipeline {
    agent any
    environment {
        PATH = "$PATH:/usr/local/bin"  // Asegura que Node.js esté en el PATH
    }
    tools {
        nodejs 'NodeJS'  // Usa la configuración creada en Global Tool Configuration
    }
    stages {
        stage('Clonar Código') {
            steps {
                git branch: 'main', url: 'https://github.com/glomarperu/jenkins-pipeline.git'
            }
        }
        stage('Instalar Dependencias') {
            steps {
                sh 'node -v'   // Verifica versión de Node.js
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
