pipeline {
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
    stage('pylint') {
      steps {
        sh 'pylint --disable=R,C src/server.py' 
      }
    }
    stage('Build docker image'){
      sh 'docker build -t registration .'
    }
  }
}
