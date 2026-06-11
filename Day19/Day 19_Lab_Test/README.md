###Part A: Docker Image Creation


Create ecs-app and eks-app folder

#Create a Python application for ECS.
app.py

from http.server import BaseHTTPRequestHandler, HTTPServer, os

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/plain")
        self.end_headers()
        self.wfile.write(b"Hello Surakshitha from ECS Application\n")

server = HTTPServer(("0.0.0.0", 8080), Handler)
print("Server running on port 8080")
server.serve_forever()


##Create a Python application for EKS.
app.py

from http.server import BaseHTTPRequestHandler, HTTPServer, os

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/plain")
        self.end_headers()
        self.wfile.write(b"Hello Surakshitha from EKS application\n")


server = HTTPServer(("0.0.0.0", 8080), Handler)
print("Server running on port 8080")
server.serve_forever()

#Write separate Dockerfiles for both applications.
dockerfile

FROM python:3.12-slim

WORKDIR /app

COPY app.py .

EXPOSE 8080

CMD ["python", "app.py"]

#Build Docker images for both applications.

##for ecs
docker build -t surakshithaecs-ecr:v2 .
docker run -d --name surakshitha-ecs-app -p 8080:8080 surakshithaecs-ecr:v2
curl http://localhost:8080

##for eks
docker build -t surakshithaeks-ecr:v2 .
docker run -d --name surakshitha-eks-app -p 8081:8080 surakshithaeks-ecr:v2
curl http://localhost:8081



Part B: Local Testing with Docker Compose
#1. Create a docker-compose.yml file.

version: "3.8"

services:
  surakshitha-ecs-app:
    image: surakshithaecs-ecr:v2
    container_name: surakshitha-ecs-app
    ports:
      - "8080:8080"
    environment:
      PARTICIPANT_NAME: Surakshitha

  surakshitha-eks-app:
    image: surakshithaeks-ecr:v2
    container_name: surakshitha-eks-app
    ports:
     - "8081:8080"
    environment:
     PARTICIPANT_NAME: Surakshitha

    restart: unless-stopped


#Configure both containers to run simultaneously on a local machine.
#Pass the PARTICIPANT_NAME environment variable to each container.
#Demonstrate successful execution of both applications.

docker compose up --build


###Part C: Amazon ECR
#Create two Amazon ECR repositories: - ecs-app-repository - eks-app-repository

aws ecr create-repository \
--repository-name surakshitha-ecs-app-repository \
--region us-east-1 --profile devops

aws ecr create-repository \
--repository-name surakshitha-eks-app-repository \
--region us-east-1 --profile devops


aws ecr get-login-password \
--region us-east-1 --profile devops | \
docker login \
--username AWS \
--password-stdin \
386757865964.dkr.ecr.us-east-1.amazonaws.com

#Tag the Docker images appropriately.

docker tag surakshithaecs-ecr:v2 386757865964.dkr.ecr.us-east-1.amazonaws.com/surakshitha-ecs-app-repository:v2

docker tag surakshithaeks-ecr:v2 386757865964.dkr.ecr.us-east-1.amazonaws.com/surakshitha-eks-app-repository:v2


#Push both images to their respective ECR repositories.
docker push 386757865964.dkr.ecr.us-east-1.amazonaws.com/surakshitha-ecs-app-repository:v2

docker push 386757865964.dkr.ecr.us-east-1.amazonaws.com/surakshitha-eks-app-repository:v2



###Part A: Amazon EKS Infrastructure
#Create a CloudFormation template (eks-cluster.yml) to provision:

- Amazon EKS Cluster - Managed Node Group - One Worker Node
#Deploy the EKS cluster and verify node readiness.