---
title: Learning Docker
author: Arthur Ulfeldt
linkcolor: lightblue
pdf-engine: xelatex
header-includes:
 - \usepackage[margin=.5in]{geometry}
classoption: "12pt"
---
<link rel="icon" href="favicon.png" type="image/png" />

# Introduction
## Why create containers using Docker?
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="LearningDocker\Introduction-Why create containers using Docker.mp4" type="video/mp4">
</video>
</p>

## What you should know
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="LearningDocker\Introduction-What you should know.mp4" type="video/mp4">
</video>
</p>

## What is Docker?
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="LearningDocker\Introduction-What is Docker.mp4" type="video/mp4">
</video>
</p>

## Using the exercise files
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="LearningDocker\Introduction-Using the exercise files.mp4" type="video/mp4">
</video>
</p>

## Chapter Quizz
1. Your server is running two containers. One of them is based on RedHat Linux. What does this say about the other container?
```The other container can run any operating system.```
2. Which statement best describes Docker containers?
```They are sealed, self-contained units of software that have everything needed to run a service.```
3. What experience is essential to use Docker?
```command line usage and tools```

---

# I. Installing Docker
## I-I. Setting up Docker
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="LearningDocker\I-I. Setting up Docker.mp4" type="video/mp4">
</video>
</p>

## I-II. Docker Desktop
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="LearningDocker\I-II. Docker Desktop.mp4" type="video/mp4">
</video>
</p>

## I-III. Install Docker on Mac
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="LearningDocker\I-III. Install Docker on Mac.mp4" type="video/mp4">
</video>
</p>

## I-IV. Install Docker on Windows
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="LearningDocker\I-IV. Install Docker on Windows.mp4" type="video/mp4">
</video>
</p>

## I-V. Install Docker on Linux
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="LearningDocker\I-V. Install Docker on Linux.mp4" type="video/mp4">
</video>
</p>

## I-VI. Chapter Quizz
### Question 1 of 5
Why should you consider running the following post-installation steps when installing Docker on a Linux machine?

```shell
sudo groupadd docker
sudo usermod -aG docker $USER
```
  > to allow non-root users to run Docker as well

### Question 2 of 5
The command docker run hello-world fails on your Windows machine. Of the following possible issues, which is not contributing to this problem?
  > The hello-world container does not support a Windows OS.

### Question 3 of 5
You are trying to run the command 'docker' on your Mac terminal, and get an error that a socket is not available. What should your first troubleshooting step be?
  > Check that Docker Desktop is running

### Question 4 of 5
Which Docker tool is considered too old to support modern Docker functionality?
  > Boot2Docker

### Question 5 of 5
What is the name of the Docker client used from the terminal?
  > docker

# II. Using Docker
## II-I. The Docker flow: Images to containers
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="LearningDocker\II-I. The Docker flow Images to containers.mp4" type="video/mp4">
</video>
</p>
```shell
docker run -ti ubuntu:latest bash
# ti = Terminal Interactive
```

## II-II. The Docker flow: Containers to images
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="LearningDocker\I-II. The Docker flow Containers to images.mp4" type="video/mp4">
</video>
</p>

## II-III. Run processes in containers
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="LearningDocker\II-III. Run processes in containers.mp4" type="video/mp4">
</video>
</p>
```shell
docker attach
docker exec 
```

## II-IV. Manage containers
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="LearningDocker\II-IV. Manage containers.mp4" type="video/mp4">
</video>
</p>
```shell
docker logs *container_name*
```

## II-V. Exposing ports
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="LearningDocker\II-V. Exposing ports.mp4" type="video/mp4">
</video>
</p>

## II-VI. Container networking
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="LearningDocker\II-VI. Container networking.mp4" type="video/mp4">
</video>
</p>

## II-VII. Legacy linking
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="LearningDocker\II-VII. Legacy linking.mp4" type="video/mp4">
</video>
</p>

## II-VIII. Images
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="LearningDocker\II-VIII. Images.mp4" type="video/mp4">
</video>
</p>

## II-IX. Volumes
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="LearningDocker\II-IX. Volumes.mp4" type="video/mp4">
</video>
</p>

## II-X. Docker registries
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="LearningDocker\II-X. Docker registries.mp4" type="video/mp4">
</video>
</p>

## II-XI. Chapter Quizz
### Question 1 of 9
You have a container running bash in detached mode. In terminal A, you attach to this container. Next, in terminal B, you 'docker exec bash' to this container. Then, back in terminal A, you exit the session. What happens to the container?

  > The container and all its processes are terminated.

### Question 2 of 9
In Docker, programs run in _____, which are comprised of _____.

  > containers; images

### Question 3 of 9
Which commands are used to upload a public image?

  > Docker login and Docker push

### Question 4 of 9
The command docker run -v volume-name ubuntu bash creates a volume that is _____, and is deleted when _____.

  > ephemeral; no container is using it

### Question 5 of 9
The command _____ is used to download images, while the command _____ is used to upload them.

  > 

    docker pull; docker push


### Question 6 of 9
Container 'aaa' is already running. You now run container 'bbb' using the command below. Which statement is true?

```shell
docker run --rm -ti --link aaa --name bbb ubuntu bash
```

  > Container 'bbb' will see the environment variables of container 'aaa'.

### Question 7 of 9
You can use the default network called _____ when a container does not require any network isolation.

  > host

### Question 8 of 9
What will not happen when you add a -p 8080 argument to a Docker run command?

  > The internal port 8080 will be accessible externally on port 8080.

### Question 9 of 9
A Docker container continues to run until _____.

  > the process that started it exits


# III. Building Docker Images
## III-I. What are Dockerfiles?
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="LearningDocker\III-I. What are Dockerfiles.mp4" type="video/mp4">
</video>
</p>

```shell
docker build -t name_of_the_image
```
- [https://docs.docker.com/engine/reference/builder/](https://docs.docker.com/engine/reference/builder/)

## III-II. Building Dockerfiles
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="LearningDocker\III-II. Building Dockerfiles.mp4" type="video/mp4">
</video>
</p>

## III-III. Dockerfile syntax
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="LearningDocker\III-III. Dockerfile syntax.mp4" type="video/mp4">
</video>
</p>

## III-IV. Multi-project Docker files
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="LearningDocker\III-IV. Multi-project Docker files.mp4" type="video/mp4">
</video>
</p>

## III-V. Avoid golden images
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="LearningDocker\III-V. Avoid golden images.mp4" type="video/mp4">
</video>
</p>

## III-VI. Chapter Quizz
### Question 1 of 5
What does the CMD command in a Docker file do?

  > It sets the program to run when the container starts.

### Question 2 of 5
Each line of a Docker file _____.

  > makes a new, independent image based on the previous line's image

### Question 3 of 5
What characterizes a golden image?

  > It replaces a canonical build with a locally-modified revision.

### Question 4 of 5
Which statement is incorrect regarding multiproject Docker files?

  > They increase the eventual image size.

### Question 5 of 5
The Docker file WORKDIR command changes directories _____.

  > both for the rest of the Docker file, and in the finished image

# IV. Under the hood
## IV-I. Docker the program
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="LearningDocker\IV-I. Docker the program.mp4" type="video/mp4">
</video>
</p>

## IV-II. Networking and namespaces
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="LearningDocker\IV-II. Networking and namespaces.mp4" type="video/mp4">
</video>
</p>

## IV-III. Processes and cgroups
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="LearningDocker\IV-III. Processes and cgroups.mp4" type="video/mp4">
</video>
</p>

## IV-IV. Storage
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="LearningDocker\IV-IV. Storage.mp4" type="video/mp4">
</video>
</p>

## IV-V. Chapter Quizz
### Question 1 of 4
Docker images are _____.

  > read only

### Question 2 of 4
Which Linux kernel feature is essential for container process isolation?

  > cgroups

### Question 3 of 4
Docker uses _____ and _____ to create virtual Ethernet networks.

  > bridges; NAT

### Question 4 of 4
What do you need to configure on a Docker container to run a Docker client within?

  > Mount the Docker socket of the host into the container.

# V. Orchestration: Building Systems with Docker
## V-I. Registries in detail
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="LearningDocker\V-I. Registries in detail.mp4" type="video/mp4">
</video>
</p>

## V-II. Intro to orchestration
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="LearningDocker\V-II. Intro to orchestration.mp4" type="video/mp4">
</video>
</p>

## V-III. Kubernetes in AWS
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="LearningDocker\V-III. Kubernetes in AWS.mp4" type="video/mp4">
</video>
</p>

## V-IV. Google Kubernetes Engine
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="LearningDocker\V-IV. Google Kubernetes Engine.mp4" type="video/mp4">
</video>
</p>

## V-V. Chapter Quizz
### Question 1 of 4
This command is used to set the registry that an image will be uploaded to.

  > docker tag

### Question 2 of 4
When deploying a Kubernetes application on Google Kubernetes Engine, which step is performed after setting the default project and compute zone?

  > Create a Kubernetes Engine cluster.

### Question 3 of 4
The Kubernetes _____ is responsible for ensuring that the relevant service is running as needed.

  > replication controller

### Question 4 of 4
Which orchestration system is only suited to single-computer orchestration?

  > docker compose


---
 
# Conclusion
## Next steps
<video width="600" height="337" controls>
  <source src="LearningDocker\Conclusion-Next steps.mp4" type="video/mp4">
</video>

## CERTIFICATION
<p style="text-align: center; text-decoration-color: red">
  [CertificateOfCompletion_Learning Docker.pdf](LearningDocker\CertificateOfCompletion_Learning Docker.pdf)
</p>

---

<p style="text-align: center"> [Learning Docker - Version PDF](LearningDocker.pdf) </p>

---
