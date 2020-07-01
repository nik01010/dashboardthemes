pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        bat 'make build'
      }
    }
    stage('Check') {
      steps {
        bat 'make check'
      }
    }
  }
}
