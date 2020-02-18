pipeline {
  agent {
    docker {
      image 'python:latest'
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