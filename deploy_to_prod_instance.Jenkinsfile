
node{

      stage('wait for Approve') {
        timeout(time:5, unit:'DAYS') {
            input message:'Approve deployment?'
        }
    }
    
	sshagent (credentials: ['stage']) {
    sh 'ssh -o StrictHostKeyChecking=no -l inception 35.228.14.250 "sudo rm -rf docker-intermine-gradle/ && git clone https://github.com/maksym-butusov/docker-intermine-gradle && cd docker-intermine-gradle && ./mkdatadirs.sh dockerhub.docker-compose.yml && sudo chmod -R 777 data/solr && docker-compose -f dockerhub.docker-compose.yml up -d"'
 
  }
}