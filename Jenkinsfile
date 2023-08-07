pipeline {
    agent any
    stages {
       stage('Checkout from Git') {
            steps {
                checkout scmGit(branches: [[name: '**']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/hades1908/tomcat-project.git']])
            }
        }
       stage('Docker Build') {
           steps {
              
                sh 'docker build . -t my-tomcat' 
                sh 'docker tag my-tomcat hades1908/my-tomcat:latest'
          }
        }
     
       stage('Publish image to Docker Hub') {
           steps {
               script{
                   withDockerRegistry(credentialsId: 'docker-hub-credentials') {
 
                       sh  'docker push hades1908/my-tomcat:latest'
                   }
               }
            }
          }
        }
      }
