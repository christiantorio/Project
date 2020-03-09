pipeline {
  def dockerpath="ctorio/registration"
   agent any 
  stages {
    stage('Checking python version') {
      steps {
        sh 'python --version'
        sh 'pip install --user -r requirements.txt'
      }
    }
    stage('Installing requirements'){
      steps{
        sh 'pip install --user -r requirements.txt'
      }
    }
    stage('Perform tidylint') {
      steps {
        sh 'tidy -q -e src/templates/*.htm' 
      }
    }
    stage('Perform pylint') {
      steps {
        sh 'pylint --disable=R,C src/server.py' 
      }
    }
    stage('Upload docker image'){
      steps{
        echo "Docker ID and Image: $dockerpath"
        sh 'docker build -t registration .'
        sh 'docker image ls'
      }
    }
    stage('Upload to AWS') {
             steps {
                 withAWS(region:'us-west-2',credentials:'aws-jenkins') {
                 sh 'echo "Uploading content with AWS creds"'
                     s3Upload(pathStyleAccessEnabled: true, payloadSigningEnabled: true, path:'/src', bucket:'project-pipeline-ci-cd')
                 }
             }
        }
  }
}
