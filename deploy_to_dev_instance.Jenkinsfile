
node{
    
    environment {
    registry = "incepti0n/intermine_tomcat"
    registryCredential = 'dockerhub'
}
sshagent (credentials: ['stage']) {
    sh 'ssh -o StrictHostKeyChecking=no -l inception 35.228.161.55 "sudo rm -rf docker-intermine-gradle/ && git clone https://github.com/maksym-butusov/docker-intermine-gradle && cd docker-intermine-gradle && ./mkdatadirs.sh dockerhub.docker-compose.yml && sudo chmod -R 777 data/solr && docker-compose -f dockerhub.docker-compose.yml up -d"'
 
  }
  }
