pipeline {
    agent any
    tools {
        // Install the Maven version configured as "M2" and add it to the path.
        maven "M2"
    }

    stages {
        stage('Compile') {
            steps {
                bat "mvn clean compile"
            }
        }

        stage('SonarQube Analysis') {
            environment {
                SONAR_TOKEN = credentials('SONAR_TOKEN')
            }
            steps {
                bat "mvn sonar:sonar -Dsonar.projectKey=mahendra-org_servlet-demo -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=${SONAR_TOKEN}"
            }   
        }                

        stage('Build') {
            steps {
                bat "mvn clean package"
            }

            post {
                success {
                    archiveArtifacts 'target/*.war'
                }
            }
        }
    }
}
