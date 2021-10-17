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
                script {
                    sh "chmod +x -R ${env.WORKSPACE}/../${env.JOB_NAME}/myec2.sh"
                }
            }
        }
    }

}
