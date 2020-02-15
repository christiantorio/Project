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
    stage('Lint HTML') {
      steps {
        sh 'tidy -q -e *.html'
      }
  }
}