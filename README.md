# Toy project on Azure Cloud

[link to the created docker image](https://hub.docker.com/layers/roaaahmed1999/toyproject/latest/images/sha256-da43c324b3d04ba4e3f7a0bb502a3c05f50aa1858c1ff80593cfe9b5a0be3f4f?context=repo)

[link to pipeline file](https://github.com/ROAAxAHMED/Toy_project/blob/main/Jenkinsfile)

## Dockerize the server.

Before you begin, make sure you have installed the following:



Docker 

Python 3 

The repository from the GitHub link 


Step 1 - Clone the Repository

First, clone the repository from GitHub using the following command: 

``` 
git clone https://github.com/alexosama-botit/exercise_do_1 
```

Step 2 - Create a Dockerfile

Next, create a Dockerfile in the root directory of the repository. This file will serve as a template for the Docker container you will create. The Dockerfile contains instructions for building the Docker image. 


The following code is an example of a Dockerfile for a Flask web app: 

``` python
FROM python:3.7 
MAINTAINER Roaa

WORKDIR /app

COPY . .

RUN python -m venv exvenv
# Activate virtual environment
ENV source exvenv/bin/activate
RUN pip install -r requirements.txt

# Expose port
EXPOSE 5000

# Run the app
CMD ["python", "src/hello.py"]
```

Step 3 - Build the Image

Once you have created the Dockerfile, use the following command to build the Docker image: 

```
docker build -t image_name .
```
Step 4 - Run the Container

Once the Docker image is built, use the following command to run the Docker container: 

```
docker run -d -p 5000:5000 image_name
```
Step 5 - Test the App

Once the Docker container is running, open your web browser and navigate to http://127.0.0.1:5000 to confirm the Flask web app is running. 

## Deploy the server using Terraform

- Create a Terraform configuration file that defines the Azure resources that you need to deploy the web app.

- Push the Docker image to the Docker hub.
- create an Azure resource group.

- Create an Azure Container Instance using the image from the Docker hub.

- create a service principal for Security Considerations, you can use either the Azure portal or the Azure CLI.

- Using the Azure portal:
```
-Log in to your Azure account and go to the Azure portal.
-Navigate to the Azure Active Directory section and select App registrations.
-Select + New registration.
-Enter a name for your service principal and select Register.
-Copy the Application (client) ID and the Directory (tenant) ID.
-Select Certificates & secrets.
-Select + New client secret and enter a Description and an Expires value.
-Select Add.
```
- Using the Azure CLI:
```
-Log in to your Azure account via the Azure CLI.
-Copy the appId and password keys.
-You will need to provide the Service Principal's appId and password as arguments when running the authentication command.
-az login --service-principal --username &#60;appId&#62; --password &#60;password&#62;
```

[Terraform files](https://github.com/ROAAxAHMED/Toy_project/tree/main/terraform)



## CI/CD pipeline

 1. Create a Jenkins job by logging into Jenkins and clicking on “New Item”.

2. Enter the job name and select “Freestyle project” from the list of options.

3. Under “Source Code Management”, select “Git” and enter the URL of your repository. 

4. Under “Build Triggers”, select “GitHub hook trigger for GITScm polling” to enable Jenkins to detect changes in your repository and trigger a build whenever changes are made to the main branch. 

5. Under “Build Environment”, select “Run tests after build” to ensure that tests are run after each build. 

6. Under “Build Steps”, add a step to deploy the application to Azure cloud if all tests pass successfully. 

7. Under “Post-build Actions”, add a step to send out a notification if any tests fail during the build process. 

8. Finally, click on “Save” and your Jenkins job is ready!
