pipeline {
    agent any
    stages {
        stage('Install dependencies') {
            steps {
                sh '''
                R -q -e "if (!requireNamespace('devtools', quietly = TRUE)) install.packages('devtools', repos = 'https://cloud.r-project.org')"
                '''
            }
        }
        stage('R CMD check') {
            steps {
                sh '''
                R -q -e "devtools::install(dependencies = TRUE)"
                R CMD check .
                '''
            }
        }
        stage('Build pkgdown site') {
            steps {
                sh '''
                R -q -e "if (!requireNamespace('pkgdown', quietly = TRUE)) install.packages('pkgdown', repos = 'https://cloud.r-project.org')"
                R -q -e "pkgdown::build_site()"
                '''
            }
        }
    }
}
