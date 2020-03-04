pipeline {
   agent any
   environment{
        BROWSER_CONFIG="-Ddriver=chrome -Dcontext=chrome"
        ENVIRONMENT_CONFIG="-Denvironment=staging"
        TAGS_CONFIG="-Dcucumber.options='--tags @cucumber'"
    }
   stages {
      stage('Test') {
         steps {
            bat "mvn clean verify ${ENVIRONMENT_CONFIG} ${ENVIRONMENT_CONFIG} ${TAGS_CONFIG}"
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