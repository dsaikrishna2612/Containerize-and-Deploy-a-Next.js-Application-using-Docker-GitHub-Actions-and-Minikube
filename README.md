# Containerize-and-Deploy-a-Next.js-Application-using-Docker-GitHub-Actions-and-Minikube

🧰 Setup Instructions

📦Connect to EC2/VM (ubuntu/linux)
#install dependencies 
yum install nodejs npm -y
npx create-next-app my-nextjs-app       #creates nextjs application
cd my-nextjs-app
npm install -y
npm run dev
check for app working http://<ec2publicip>:3000

🐳 Docker Installation

yum install docker -y         #to install docker
systemctl start docker        #to start docker engine
vi Dockerfile               #to create docker file

🐳 Docker Commands

docker build -t nextjs-devops-assessment .      #build the docker image
docker images                                   #to list all the docker images
docker inspect nextjs-devops-assessment        #to inspect output and size of the image
docker run -p 3000:3000 nextjs-devops-assessment       #to test the image

⚙️Push code to the Github

yum install git -y
git clone <github repo url>
cp -r my-nextjs-app/ <repo folder>
cd repo folder
mkdir -p github/workflows
touch github/workflows/build.yml    #file to run github actions
vi deployment.yml
vi service.yml
git add . 
git commit -m "devops assignment submission"
git push
 
⚙️ GitHub Actions
Automatically builds and pushes image to GHCR on main branch push

Tags: latest and commit SHA

☸️ Minikube Deployment

minikube start --driver=docker              #to create a kubernetes cluster
kubectl get nodes                           #to check for worker nodes
kubectl apply -f k8s/                       #to deploy the yml files
kubectl get pods                            #to check for running pods
kubectl get svc
minikube service nextjs-service

🌐 Accessing the App
Run minikube service nextjs-service

It will open the app in your browser via NodePort

 