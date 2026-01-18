// Jenkinsfile - Pipeline CI/CD para My Construcción
// Este archivo define el proceso de construcción automatizado con Jenkins

pipeline {
    agent any
    
    // Variables de entorno
    environment {
        JAVA_HOME = tool 'JDK11'
        MAVEN_HOME = tool 'Maven3'
        PATH = "${JAVA_HOME}/bin:${MAVEN_HOME}/bin:${env.PATH}"
        ARTIFACTORY_URL = 'http://localhost:8082/artifactory'
        ARTIFACT_NAME = 'my-construccion'
        VERSION = '1.0.0'
    }
    
    // Opciones del pipeline
    options {
        buildDiscarder(logRotator(numToKeepStr: '10'))
        timestamps()
        timeout(time: 30, unit: 'MINUTES')
    }
    
    // Etapas del Pipeline
    stages {
        
        // Etapa 1: Checkout del código fuente
        stage('Checkout') {
            steps {
                echo '📥 Descargando código fuente desde repositorio...'
                checkout scm
            }
        }
        
        // Etapa 2: Compilación del proyecto
        stage('Build') {
            steps {
                echo '🔨 Compilando proyecto Maven...'
                sh '''
                    echo "JAVA_HOME: $JAVA_HOME"
                    echo "MAVEN_HOME: $MAVEN_HOME"
                    java -version
                    mvn -version
                    mvn clean compile
                '''
            }
        }
        
        // Etapa 3: Ejecución de pruebas
        stage('Test') {
            steps {
                echo '🧪 Ejecutando pruebas unitarias...'
                sh 'mvn test'
            }
            post {
                always {
                    junit allowEmptyResults: true, testResults: 'target/surefire-reports/*.xml'
                }
            }
        }
        
        // Etapa 4: Empaquetado WAR
        stage('Package') {
            steps {
                echo '📦 Generando archivo WAR...'
                sh 'mvn package -DskipTests'
            }
            post {
                success {
                    echo '✅ Archivo WAR generado exitosamente'
                    archiveArtifacts artifacts: 'target/*.war', fingerprint: true
                }
            }
        }
        
        // Etapa 5: Análisis de código (opcional)
        stage('Code Analysis') {
            steps {
                echo '🔍 Analizando calidad del código...'
                sh 'mvn checkstyle:checkstyle || true'
            }
        }
        
        // Etapa 6: Publicar a JFrog Artifactory
        stage('Deploy to Artifactory') {
            steps {
                echo '🚀 Publicando artefacto a JFrog Artifactory...'
                script {
                    // Configuración de Artifactory
                    def server = Artifactory.server 'artifactory-server'
                    
                    def uploadSpec = """{
                        "files": [
                            {
                                "pattern": "target/*.war",
                                "target": "libs-release-local/com/myconstruccion/${ARTIFACT_NAME}/${VERSION}/"
                            }
                        ]
                    }"""
                    
                    server.upload(uploadSpec)
                }
            }
        }
    }
    
    // Acciones post-ejecución
    post {
        success {
            echo '🎉 Pipeline ejecutado exitosamente!'
            echo "El archivo WAR se encuentra en: target/${ARTIFACT_NAME}.war"
        }
        failure {
            echo '❌ El pipeline ha fallado. Revisar los logs.'
        }
        always {
            echo '🧹 Limpiando workspace...'
            cleanWs()
        }
    }
}
