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
            steps{
                cleanWs()
            }
        }
    }
    stages{
        stage("Checkout from SCM"){
            steps{
                git branch: 'main', credentialsID: 'github', url: 'https://github.com/Mykulle/CI-CD-Pipepline-Project'
            }
        }
    }
}