
pipeline {
    agent any
    
    stages {
        stage('Create Job') {
            steps {
                echo 'Creating Jenkins Job...'
                // Create a Job in Jenkins
            }
        }
        
        stage('Set-up Job') {
            steps {
                echo 'Setting up Jenkins job...'
                // Set-up the job
                git url: "https://github.com/ROAAxAHMED/Toy_project"
                triggers {
                    githubPush()
                }
                steps {
                    // Deploy application to Azure Cloud
                    script {
                        sh 'azure-cli-deploy.sh'
                    }
                }
                post {
                    always {
                        // Send notification if any tests fail
                        script {
                            sh 'notification-script.sh'
                        }
                    }
                }
            }
        }
    }
}

