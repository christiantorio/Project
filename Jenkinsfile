pipeline {
  agent any 
  environment {
    registry= "ctorio/registration"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  stages {
    stage('Clone repository') {
      steps{
        echo 'Making sure we have the repository cloned to our workspace'
        checkout scm
      }
    }
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
    stage('Build docker'){
      steps {
        sh 'docker build -t registration .'
        sh 'docker image ls'
      }
    }
    stage('Upload docker image'){
      steps {
        script {
          docker.build registry + ":$BUILD_NUMBER"
          docker.withRegistry( '', registryCredential ) {
          dockerImage.push()
        }
    }
    // stage('Upload to AWS') {
    //   steps {
    //       withAWS(region:'us-west-2',credentials:'aws-jenkins') {
    //       sh 'echo "Uploading content with AWS creds"'
    //           s3Upload(pathStyleAccessEnabled: true, payloadSigningEnabled: true, path:'/src', bucket:'project-pipeline-ci-cd')
    //       }
    //   }
    // }
  }
}
