pipeline {
   agent any
   stages {
      stage('Test') {
         steps {
            bat "mvn clean verify"
         }
         post {
            always {
               junit '**/target/site/serenity/*JUNIT*.xml'
               publishHTML([allowMissing: true, alwaysLinkToLastBuild: true, keepAll: true, reportDir: 'target/site/serenity', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: ''])
            }
         }
      }
   }
}