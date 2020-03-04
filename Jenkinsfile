pipeline {
   agent any
   environment{
        ENVIRONMENT_CONFIG='-Denvironment=staging'
        BROWSER_CONFIG='-Ddriver=chrome -Dcontext=chrome'
        TAGS_CONFIG='-Dcucumber.options="--tags @cucumber"'
    }
   stages {
      stage('Test') {
         steps {
            bat 'mvn clean verify ' + ENVIRONMENT_CONFIG + ' ' + BROWSER_CONFIG + ' ' + TAGS_CONFIG
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