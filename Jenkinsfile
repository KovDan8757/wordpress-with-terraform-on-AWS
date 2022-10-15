pipeline {
    agent any

    options {
        skipDefaultCheckout(true)
        ansiColor('xterm')
        timestamps ()
    }

    environment {
        AWS_ACCESS_KEY = credentials('AWS_ACCESS_KEY_RT')
        AWS_SECRET_KEY = credentials('AWS_SECRET_KEY_RT')
    }

    stages {
        stage("Clean Ws") {
            steps {
                //dir ('Sprint3-Terraform/wordpress-dev') {
                //    withCredentials([string(credentialsId: 'AWS_PUBLIC_KEY', variable: 'AWS_PUB_KEY')]) {
                //        sh 'terraform destroy -input=false -auto-approve -var=AWS_PUB_KEY="${AWS_PUB_KEY}"'
                //    }
                //}  
            cleanWs()
            }
        }
        //stage ('Invoke_pipeline') {
        //    steps {
        //        build job: 'terraform_s3bucket', propagate: true, wait: true
        //    }
        //}
        stage("Checkout branch") {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/richard_tolnai_jenkins']], extensions: [], userRemoteConfigs: [[credentialsId: 'richard_tolnai_ssh_gitlab', url: 'git@git.epam.com:gabor_nagy4/devops-academy-2021-1.git']]])
            }
        }
      
        stage('Initalizing and Validate') {
              steps {
                dir ('Sprint3-Terraform/wordpress-dev') {
                  sh 'terraform init -input=false'
                  sh 'terraform validate | grep valid > valid.txt'
                }
                script {
                  isValid = readFile('Sprint3-Terraform/wordpress-dev/valid.txt').contains('The configuration is valid.')
                  if (!isValid) {
                    error('Terraform configuration is invalid.')
                  }
                }
              }
                post {
                    failure {
                        mail body: "AWS_INFRA Init Stage Failure.\n\nDetails at ${env.BUILD_URL}", subject: 'AWS_INFRA Jenkins Init FAIL', to: "${env.RECIPIENTS}"
                    }
                }
            }

        stage('Plan') {
            steps {
                dir ('Sprint3-Terraform/wordpress-dev') {
                    withCredentials([string(credentialsId: 'AWS_PUBLIC_KEY', variable: 'AWS_PUB_KEY')]) {
                        sh 'terraform init -input=false -var=AWS_PUB_KEY="${AWS_PUB_KEY}"'
                        sh 'terraform plan -input=false -out mytfplan -var=AWS_PUB_KEY="${AWS_PUB_KEY}"'
                        sh 'terraform show -no-color mytfplan > destroy.txt'
                    }
                }
            }
            post {
                success {
                    mail body: "AWS_INFRA Plan Stage Success.\n\nDetails at ${env.BUILD_URL}", subject: 'AWS_INFRA Jenkins Plan Success', to: "${env.RECIPIENTS}"
                }
            }
        }

        stage("Destroy Approval") {
            when {
                expression {
                    return readFile('Sprint3-Terraform/wordpress-dev/destroy.txt') =~ /.*[1-9]\d* to destroy.*/
                }
            }
            steps {
                script {
                    input message: "Objects are to be destroyed! Proceed?"
                }
            }
        }

        stage('Apply') {
            steps {
                dir ('Sprint3-Terraform/wordpress-dev') {
                    sh 'terraform apply -auto-approve mytfplan'
                }
            }
            post {
                always {
                    dir ('Sprint3-Terraform/wordpress-dev') {
                        sh 'rm -rf tfplan tfplan.txt'
                    }
                }
                success {
                    mail body: "AWS_INFRA Apply Success.\n\nDetails at ${env.BUILD_URL}", subject: 'AWS_INFRA Jenkins Apply Success', to: "${env.RECIPIENTS}"
                }
            }
        }
    }
}