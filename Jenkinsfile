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
        
        stage("Checkout from SCM"){
            steps{
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/Mykulle/CI-CD-Pipepline-Project'
            }
        }
    }
}