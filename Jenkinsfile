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
                 sh 'terraform plan -force'
                 break
             case "apply":
                 echo "Running your choice of ${params.action}"
                 sh 'terraform apply -auto-approve'
                       
                 break
             default:
                 println("This is an error")
                 break
         }
     }
}
