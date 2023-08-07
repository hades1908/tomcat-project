stage('Docker Build') {
           steps {
              
                sh 'docker build . -t my-tomcat' 
                sh 'docker tag my-tomcat yagnik/my-tomcat:latest'
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
        withDockerRegistry([ credentialsId: "docker-hub-credentials", url: "" ]) {
          sh  'docker yagnik/my-tomcat:latest' 
        }
                  
          }
        }
