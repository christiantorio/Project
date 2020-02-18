pipeline {
  agent {
    docker {
      image 'python:3.5.1'
      args '--privileged'
    }

  }
  stages {
    stage('') {
      steps {
        sh 'python --version'
      }
    }
    stage('Lint Python') {
      steps {
        sh 'pylint --disable=R,C,W1203 server.py'
      }
  }
  }
}