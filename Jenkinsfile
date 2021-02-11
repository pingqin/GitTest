pipeline {
    agent any
    tools {
  terraform 'terraform'
}
 stages{
    stage('Git Checkout'){
         steps{
           git credentialsId: 'amzm3', url: 'git@github.com:PeterQin001/GitTest.git'
         }
     }
     stage('Terraform Init'){
         steps{
             sh 'terraform init'
         }
     }
     stage('Terraform plan'){
        steps{
             sh label:'', script: 'terraform plan --auto-approve'
         }
     }
 }
}
