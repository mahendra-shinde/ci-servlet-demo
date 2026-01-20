pipeline {
    agent any
    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "M3"
    }

    stages {
        stage('Compile') {
            steps {
                sh "mvn clean compile"
            }
        }

        stage('SonarQube Analysis') {
            environment {
                SONAR_TOKEN = credentials('SONAR_TOKEN')
            }
            steps {
                sh "mvn sonar:sonar -Dsonar.projectKey=mahendra-org_servlet-demo -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=${SONAR_TOKEN}"
            }   
        }                

        stage('Build') {
            steps {
                sh "mvn clean package"
            }

            post {
                success {
                    archiveArtifacts 'target/*.war'
                }
            }
        }
    }
}
