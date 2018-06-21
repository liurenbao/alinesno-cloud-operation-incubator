docker run -p 8080:8080 -p 50000:50000 jenkins
docker run -p 8080:8080 -p 50000:50000 -v /your/home:/var/jenkins_home jenkins
docker run --name myjenkins -p 8080:8080 -p 50000:50000 -v /var/jenkins_home jenkins
