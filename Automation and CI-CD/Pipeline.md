pipeline {
 agent any
 stages {
  stage('Git') {
   steps {git 'https://github.com/DinisGaliev/sdvps-materials.git'}
  }
  stage('Test') {
   steps {
    sh '/usr/local/go/bin/go test .'
   }
  }
  stage('Build Go Binary') {
   steps {
    sh 'CGO_ENABLED=0 GOOS=linux /usr/local/go/bin/go build -a -installsuffix nocgo .'
   }
  }
  stage('Upload to Nexus') {
   steps {
    sh 'curl -v -u “admin:12345” http://192.168.0.11:8081/repository/my-repository/hello-world:v$BUILD_NUMBER -F “file=ubuntu-bionic:8081/hello-world:v$BUILD_NUMBER”' 
    }
  }
 }
}
