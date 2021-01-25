properties([pipelineTriggers([githubPush()])])

pipeline {
    agent { 
      docker {
        image 'hashicorp/terraform'
        args  '--entrypoint='
      }
    }
    
    stages {
      stages('Terraform Init'){
        steps {
          sh "terraform init"
        }
    }
     stage('Plan') {
            steps {
                sh "terraform plan"
            }
}
