#!/usr/bin/env groovy
/* vim: ft=groovy syntax=groovy
/* -*- mode: groovy; coding: utf-8 -*- */
import java.text.SimpleDateFormat
import groovy.io.FileType
properties(
    [
        parameters(
        choice(
            choices: ["plan", "apply"], description: '', name: 'action')
        )
    ]
)
node('master') {
    stage('Git checkout') {
        checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '<make-new>', url: 'git@github.com:rizzob456/nct-sftp-transfer.git']]])
    }
    stage('Terraform initialize') {
        terraform init
        terraform validate
    }
    stage('Running choice') {
        echo "Running with your choice of: ${params.action}"
        switch("${params.dryRun}") {
            case "plan":
                echo "Running your choice of ${params.action}"
                terraform plan --auto-approve
                break
            case "apply":
                echo "Running your choice of ${params.action}"
                terraform apply --auto-approve
                break
            default:
                println("This is an error")
                break
        }
    }
}
