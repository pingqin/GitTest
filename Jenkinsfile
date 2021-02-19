pipeline {
    agent any
 stages{
    stage('Git Checkout'){
         steps{
           git credentialsId: 'amzm3', url: 'git@github.com:PeterQin001/GitTest.git', branch: 'main'
         }
     }
     stage('Terraform Init'){
         steps{
             sh 'terraform init'
         }
     }
     stage('Terraform Apply'){
        steps{
             sh 'terraform  destroy --auto-approve'
           //  sh 'terraform  apply --auto-approve'
         }
     }
 }
}
