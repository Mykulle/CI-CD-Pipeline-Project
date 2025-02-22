pipeline{
    agent{
        label "jenkins-agent"
    }
    tools{
        jdk 'Java21'
        maven 'Maven3'
    }
    stages{
        stage("Cleanup Workspace"){
            steps {
                cleanWs()
            }
        }

        stage("Checkout from SCM"){
            steps {
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/Mykulle/CI-CD-Pipepline-Project'
            }
        }

        stage("Build application"){
            steps {
                sh "mvn clean package"
            }
        }

        stage("Test Application"){
            steps {
                sh "mvn test"
            }
        }

        stage("Sonarqube Analysis"){
            steps {
                withSonarQubeEnv(credentialsId: 'jenkins-sonarqube-token'){
                    sh "mvn sonar:sonar"
                }
            }
        }
    }
}