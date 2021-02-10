pipeline {
    agent any
    tools {
  terraform 'terraform'
}
 stages{
    stage('Git Checkout'){
         steps{
           git credentialsId: 'jenkinsec2-user', url: 'git@github.com:PeterQin001/GitTest.git'
         }
     }
     stage('Terraform Init'){
         steps{
             sh 'terraform init'
         }
     }
 //    stage('Terraform Apply'){
  //       steps{
   //          sh label:'', script: 'teraform apply --auto-approve'
 //        }
     }
 }
}
