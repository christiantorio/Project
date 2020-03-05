pipeline {
   agent any 
  stages {
    stage('Checking python version') {
      steps {
        sh 'python --version'
        sh 'pip install --user -r requirements.txt'
      }
    }
    stage('pylint') {
      steps {
        sh 'pylint --disable=R,C src/server.py' 
      }
    }
  }
}
