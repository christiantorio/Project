pipeline {
  agent {
    docker {
      image 'python:3.5.1'
      args '--privileged'
    }

  }
  stages {
    stage('Checking python version') {
      steps {
        sh 'python --version'
      }
    }
    stage('Hadolint and pylint') {
      steps {
        sh 'hadolint Dockerfile'
        sh 'pylint --disable=R,C src/server.py' 
      }
    }
  }
}