# Containerize-and-Deploy-a-Next.js-Application-using-Docker-GitHub-Actions-and-Minikube

🧰 Setup Instructions

📦Connect to EC2/VM (ubuntu/linux)

#install dependencies 

yum install nodejs npm -y

#creates nextjs application

npx create-next-app my-nextjs-app       
cd my-nextjs-app
npm install -y

#run the application

npm run dev
check for app working http://<ec2publicip>:3000

🐳 Docker Installation

#docker installation

yum install docker -y

#start docker engine

systemctl start docker

#create docker file

vi Dockerfile               

🐳 Docker Commands

#build the docker image

docker build -t nextjs-devops-assessment .      

#to list all the docker images

docker images                 

#to inspect output and size of the image

docker inspect nextjs-devops-assessment 

#to test the image

docker run -dt -p 3000:3000 nextjs-devops-assessment       

⚙️Push code to the Github

#git installation

yum install git -y

#clone the repository

git clone <github repo url>

#copy the nexjs application into the repository folder

cp -r my-nextjs-app/ <repo folder>

cd repo folder

#create github actions file

mkdir -p github/workflows
touch github/workflows/build.yml    

#create kubernetes yaml files

vi deployment.yml
vi service.yml

#push the changes

git add . 
git commit -m "devops assignment submission"
git push
 
⚙️ GitHub Actions

Automatically builds and pushes image to GHCR on main branch push

Tags: latest and commit SHA

☸️ Minikube Deployment

#create a kubernetes cluster

minikube start --driver=docker

#check for nodes

kubectl get nodes

#deploy the yaml files

kubectl apply -f k8s/ 

#check for running pods

kubectl get pods                            
kubectl get svc

#check for running of the next.js app

🌐 Accessing the App

Run minikube service nextjs-service

It will open the app in your browser via NodePort

 