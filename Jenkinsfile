pipeline {
    agent any
    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "M3"
    }

    stages {
        stage('Compile') {
            steps {
                bat "mvn clean compile"
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
