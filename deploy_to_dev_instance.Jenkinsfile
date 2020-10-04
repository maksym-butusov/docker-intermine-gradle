
node{
    
	sshagent (credentials: ['stage']) {
    sh 'ssh -o StrictHostKeyChecking=no -l inception 35.228.161.55 "sudo rm -rf docker-intermine-gradle/ && git clone https://github.com/maksym-butusov/docker-intermine-gradle && cd docker-intermine-gradle && ./mkdatadirs.sh dockerhub.docker-compose.yml && sudo chmod -R 777 data/solr && docker-compose -f dockerhub.docker-compose.yml up -d"'
 
  }

    stage('Sleep-waiting APP') {
    sh "sleep 27m"
}

  stage('Check Availability APP page') {
          timeout(time: 10, unit: 'SECONDS') {
               stage('Check Availability APP') {
          script {
               waitUntil {
                    try {
                         sh "curl -s --head  --request GET  http://35.228.161.55:9999/biotestmine/begin.do | grep '200'"
                         return true
                    } catch (Exception e) {
                         return false
                    }
               }
          }
               }
          }
     }

stage('docker-compose down') {
    sh "ssh -o StrictHostKeyChecking=no -l inception 35.228.161.55 && docker-compose -f dockerhub.docker-compose.yml down"
}

}
