#!/usr/bin/env groovy
/* vim: ft=groovy syntax=groovy
/* -*- mode: groovy; coding: utf-8 -*- */
import java.text.SimpleDateFormat
import groovy.io.FileType
properties(
    [
        parameters(
            [choice(
            choices: ["plan", "apply"], description: '', name: 'action')]
        )
    ]
)
node('master') {
    stage('Git checkout') {
        checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'amzm3', url: 'git@github.com:Peterqin001/GitTest.git']]])
    }
    stage('Terraform initialize') {
        sh 'terraform init'
        sh  'terraform validate'
    }
     stage('Running choice') {
         echo "Running with your choice of: ${params.action}"
         switch("${params.action}") {
             case "plan":
                 echo "Running your choice of ${params.action}"
                 sh 'terraform plan -out=tfplan -input=false'
                 break
            case "apply":
                echo "Running your choice of (this will require your confirmation first): ${params.action}"
                    try {
                        if ("${params.action}" == 'apply'){
                            sh 'terraform plan -out=plan.out'
                                timeout(time: 30, unit:'MINUTES') {
                                    input (message: "Apply Plan?", ok: 'Apply')
                                //       sh 'terraform apply plan.out'
                                //         sh 'terraform state rm aws_transfer_ssh_key.transfer_server_ssh_key'
                                           sh 'terraform state show aws_transfer_user.transfer_server_user'
                                           sh 'terraform state show aws_transfer_ssh_key.transfer_server_ssh_key'
                                //         sh 'terraform state rm aws_transfer_user.transfer_server_user'
                                 //      sh 'terraform import aws_transfer_user.transfer_server_user s-ad41f033819941279/pqin'
                                //         sh 'terraform import aws_transfer_user.transfer_server_user s-ad41f033819941279/user1'
                               //        sh 'terraform import aws_transfer_ssh_key.transfer_server_ssh_key s-ad41f033819941279/pqin/key-72721ee58ed641169'
                                //         sh 'terraform import aws_transfer_ssh_key.transfer_server_ssh_key s-ad41f033819941279/user1/key-58577206171a4c178'
                               //        sh 'terraform destroy -auto-approve'
                                    return true
                                }
                        } else {
                            return false
                        }
                    }
                    catch (err) {
                        currentBuild.result = 'FAILURE'
                        return false
                    }
                    break
            default:
                println("This is an error")
                break
        }
    }
}
