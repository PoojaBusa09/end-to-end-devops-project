pipeline {

    agent any

    tools {
        maven 'Maven3'
    }
    environment {
    SONAR_PROJECT_KEY = "end-to-end-devops-project"
    SONAR_PROJECT_NAME = "end-to-end-devops-project"
    SONAR_HOST_URL = "http://192.168.0.50:9000"
}


    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/PoojaBusa09/end-to-end-devops-project.git'
            }
        }
        stage('Build') {
            steps {
             sh 'mvn clean package'
    }
}

       stage('SonarQube Analysis') {
    steps {
        withSonarQubeEnv('SonarQube') {
            withCredentials([string(credentialsId: 'sonar-token', variable: 'SONAR_TOKEN')]) {

                sh """
                mvn clean verify sonar:sonar \
                -Dsonar.projectKey=${SONAR_PROJECT_KEY} \
                -Dsonar.projectName=${SONAR_PROJECT_NAME} \
                -Dsonar.host.url=${SONAR_HOST_URL} \
                -Dsonar.login=${SONAR_TOKEN}
                """
            }
        }
    }
}
     stage('Docker Build') {
    steps {
        sh 'docker build -t java-app .'
    }
}

        stage('Kubernetes Deploy') {
            steps {
                 withEnv(["KUBECONFIG=/var/lib/jenkins/.kube/config"]) {
                    sh '''
                        kubectl config current-context
                        kubectl apply -f kubernetes/
                    '''
                }
            }
        }
    }
}
