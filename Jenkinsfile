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
     
      stage('Run Docker container on Jenkins Agent') {
             
            steps 
   {
                sh "docker run -d -p 8003:8080 yagnik/my-tomcat"
 
            }
        }
