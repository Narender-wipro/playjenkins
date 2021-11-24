pipeline {

  options {
    ansiColor('xterm')
  }

  agent {
    kubernetes {
      yamlFile 'builder.yaml'
    }
  }

  stages {
    
    stage('Get a Maven project') {
      steps {
      container('maven') {
          // sh 'ls -l'
          // sh 'cd initial'
          // sh 'ls -l'
          sh 'mvn package -f initial/pom.xml'
      }
    }
   }

    stage('Kaniko Build & Push Image') {
      steps {
        container('kaniko') {
          script {
            sh 'pwd'
            sh '''
            /kaniko/executor --dockerfile `pwd`/Dockerfile \
                             --context `pwd` \
                             --destination=cnap-harbor.release-final.pks-wipro.com/kube-demo/web:${BUILD_NUMBER}
            '''
          }
        }
      }
    }

//     stage('Deploy App to Kubernetes') {     
//       steps {
//         container('kubectl') {
//           withCredentials([file(credentialsId: 'mykubeconfig', variable: 'KUBECONFIG')]) {
//             sh 'sed -i "s/<TAG>/${BUILD_NUMBER}/" myweb.yaml'
//             sh 'kubectl apply -f myweb.yaml'
//           }
//         }
//       }
//     }
  
  }
}
