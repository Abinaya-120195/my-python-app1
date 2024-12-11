pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'abinayapalraj12/my-python-app1:latest'
        KUBE_NAMESPACE = 'default'
    }
    stages {
        stage('Clone Repository') {
            steps {
                //git 'https://github.com/Abinaya-120195/my-python-app1.git'
                echo "Hello ABi"
            }
            
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker-hubcredentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
    sh 'docker login -u $DOCKER_USER -p $DOCKER_PASS'
}

                  //  sh 'docker login -u abinayapalraj12 -p Information@12'
                sh 'docker push $DOCKER_IMAGE'
               }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    withCredentials([file(credentialsId: 'k8s-token', variable: 'KUBECONFIG')]){
                    sh """
                    kubectl config set-context --current --namespace=$KUBE_NAMESPACE
                    //kubectl apply -f k8s-manifests/deployment.yaml --validate=false
                   // kubectl apply -f k8s-manifests/service.yaml --validate=false
                    """
               }
            }
        }
    }
    }
}
