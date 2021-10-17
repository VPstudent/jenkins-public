pipeline {
    agent any
    stages {
        stage ('Checkout') {
            steps {
                git branch: 'main', url: 'git@github.com:VPstudent/jenkins-public.git'
            }
        }

        stage ('CreateEnv') {
            steps {
                sh '''#!/bin/bash
                        aws ec2 run-instances --image-id ami-074cce78125f09d61 --count 1 --instance-type t2.micro --key-name DevOps21 --region us-east-2
                '''
            }
        }
    }

}
