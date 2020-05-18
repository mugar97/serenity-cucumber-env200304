pipeline {
   agent any
   environment{
        ENVIRONMENT_CONFIG="-Denvironment=${PEnvironment}"
        CHROME_BROWSER_CONFIG = "-Ddriver=chrome -Dcontext=chrome"
        FIREFOX_BROWSER_CONFIG = "-Ddriver=firefox -Dcontext=firefox"
        TAGS_CONFIG="-Dcucumber.filter.tags=\"${PTags}\""
    }

    stages {
        stage('Prepare') {
            steps {
               bat 'mvn clean process-test-classes'
            }
        }
        stage ('Runt tests') {
            steps {
                parallel chrome: {
                    bat 'mvn failsafe:integration-test ' + ENVIRONMENT_CONFIG + ' ' + CHROME_BROWSER_CONFIG + ' ' + TAGS_CONFIG
                }, firefox: {
                    bat 'mvn failsafe:integration-test ' + ENVIRONMENT_CONFIG + ' ' + FIREFOX_BROWSER_CONFIG + ' ' + TAGS_CONFIG
                }
            }
        }
        stage('publish reports'){
            steps {
                bat 'mvn serenity:aggregate'
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
