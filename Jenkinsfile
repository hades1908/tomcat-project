pipeline {
    agent any
	
	environment {
        REMOTE_HOST = '172.31.42.129'
        REMOTE_USER = 'ec2-user'
        REMOTE_KEY = '/var/lib/jenkins/ec2-key/tomcat-target-server-key.pem'
        GITHUB_REPO = 'https://github.com/hades1908/tomcat-project.git'
        COMPOSE_FILE = 'docker-compose.yml'
    }
	
    stages {
       stage('Checkout from Git') {
            steps {
                checkout scmGit(branches: [[name: '**']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/hades1908/tomcat-project.git']])
            }
        }
       stage('Docker Build') {
           steps {
              
                sh 'docker build . -t my-tomcat' 
                sh 'docker tag my-tomcat hades1908/my-tomcat:dev_09082023-1'
          }
        }
     
       stage('Publish image to Docker Hub') {
           steps {
               script{
                   withDockerRegistry(credentialsId: 'docker-hub-credentials') {
 
                       sh  'docker push hades1908/my-tomcat:dev_09082023-1'
                   }
               }
            }
          }

		stage('Deploy with Docker Compose') {
            steps {
                script {
				    dir('/var/lib/jenkins/tomcat-project') {
                    sh "git fetch ${GITHUB_REPO}"
                    sh "scp -i ${REMOTE_KEY} /var/lib/jenkins/tomcat-project/${COMPOSE_FILE} ${REMOTE_USER}@${REMOTE_HOST}:${COMPOSE_FILE}"
                    sh "ssh -i ${REMOTE_KEY} ${REMOTE_USER}@${REMOTE_HOST} 'docker compose -f ${COMPOSE_FILE} up -d'"
                    sh "rm -rf /var/lib/jenkins/tomcat-project/tomcat-project"
				}
			  }
           }
        }
    }
}
