pipeline {
    agent any
 stages{
    stage('Git Checkout'){
         steps{
           git credentialsId: 'jenkinsubuntu', url: 'git@github.com:PeterQin001/GitTest.git', branch: 'main'
         }
     }
     stage('Terraform Init'){
         steps{
             sh 'terraform init'
         }
     }
     stage('Terraform plan'){
        steps{
             sh 'terraform plan'
         }
     }
 }
}
