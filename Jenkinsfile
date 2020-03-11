pipeline {
  agent any 
  environment {
    dockerpath = "ctorio/registration"
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
        withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'password', usernameVariable: 'user')]) 
          sh 'docker login -u $user -p $password'
          sh 'docker tag registration $dockerpath'
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
