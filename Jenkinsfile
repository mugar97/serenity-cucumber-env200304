pipeline {
   agent any
   environment{
        ENVIRONMENT_CONFIG='-Denvironment=' + params.PEnvironment
        BROWSER_CONFIG='-Ddriver=' + params.PBrowser + ' -Dcontext=' + params.PBrowser
        TAGS_CONFIG='-Dcucumber.options="--tags ' + PTags + '"'
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