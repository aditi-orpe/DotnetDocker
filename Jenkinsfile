pipeline{
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }
    stages{
        stage("Clone the Code"){
            steps{
                git url:"https://github.com/aditi-orpe/DotnetDocker.git",branch:"master"
            }
            
        }
        stage("Build"){
            steps{
                sh "docker build -t dotnet-app ."
            }
        }
        stage("Push to docker hub"){
            steps{
                echo "$DOCKERHUB_CREDENTIALS_USR"
                sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
                sh "docker tag dotnet-app aditiorpe/dotnet-app-ubuntu-demo2:latest"
                sh "docker push aditiorpe/dotnet-app-ubuntu-demo2:latest"
            }
        }
        stage("Deploy"){
            steps{
                echo "Deploy"
                sh "docker-compose down && docker-compose up -d"
            }
        }
        
    }
}
