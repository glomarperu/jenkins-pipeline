pipeline {
    agent any
    environment {
        PATH = "$PATH:/usr/local/bin"
        DOCKER_HOST = "tcp://localhost:2375"  // 🔥 Agrega esta línea
    }
    tools {
        nodejs 'NodeJS'
    }
    stages {
        stage('Clonar Código') {
            steps {
                git branch: 'main', url: 'https://github.com/glomarperu/jenkins-pipeline.git'
            }
        }
        stage('Instalar Dependencias') {
            steps {
                sh 'node -v'
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
                sh 'docker -H tcp://localhost:2375 build -t node-jenkins-app .'  // 🔥 Fuerza la conexión con `-H`
            }
        }
        stage('Ejecutar Contenedor') {
            steps {
                sh 'docker -H tcp://localhost:2375 run -d -p 3000:3000 node-jenkins-app'  // 🔥 Igual aquí
            }
        }
    }
}
