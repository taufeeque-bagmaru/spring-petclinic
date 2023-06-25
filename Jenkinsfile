pipeline {
    agent {
        node {
            label 'aws'
        }
    }

    triggers {
        githubPush()
    }

    stages {
        stage('Build') {
            steps {
                script {
                    sh 'sudo apt-get install maven'
                    sh 'docker build -t myapp .'
                }
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh 'kubectl create deployment deployment-sre --image=docker-sre'
                    sh 'docker run -d --name container-sre docker-sre'
                }
            }
        }

        stage('prod-approval') {
            steps {
                input(id: 'prod-approval', message: 'Approve deployment to production?', submitter: 'admin')
            }
        }
    }

    post {
        always {
            emailext subject: "Pipeline Status - ${currentBuild.currentResult}",
                body: "Pipeline status: ${currentBuild.currentResult}",
                to: "taufeeque.bagmaru@gmail.com"
            
            sh 'rm -rf /path/to/temporary/files'
        }
    }
}



