pipeline {
    agent any
    tools {
  terraform 'terraform'
}
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
     stage('Terraform plan'){
        steps{
             sh label:'', script: 'terraform plan --auto-approve'
         }
     }
 }
}
