pipeline{
	agent any
	stages{
		stage('Build docker image'){
			steps {
				script {
					def scmVars = checkout([
						$class: 'GitSCM',
						doGenerateSubmoduleConfigurations: false,
						userRemoteConfigs: [[
							url: 'https://github.com/GuGu910/test.git'
						]],
						branches: [[name: '*/master']]
					])
				sh "sudo docker build -f ./app_flask/Dockerfile -t app_flask:${scmVars.GIT_COMMIT} ./app_flask"
				}
			}
		}
		stage('Push image to OCIR') { 
			steps {
				script {
					def scmVars = checkout([
						$class: 'GitSCM',
						doGenerateSubmoduleConfigurations: false,
						userRemoteConfigs: [[
							url: 'https://github.com/GuGu910/test.git'
						]],
						branches: [ [name: '*/master'] ]
					])
				sh "sudo docker login -u ${params.REGISTRY_USERNAME} -p ${params.REGISTRY_TOKEN} eu-frankfurt-1.ocir.io"
				sh "sudo docker tag app_flask:${scmVars.GIT_COMMIT} ${params.DOCKER_REPO}:${scmVars.GIT_COMMIT}"
				sh "sudo docker push ${params.DOCKER_REPO}:${scmVars.GIT_COMMIT}" 
				env.GIT_COMMIT = scmVars.GIT_COMMIT
				sh "export GIT_COMMIT=${env.GIT_COMMIT}"
				}
			}
		}
		stage('Deploy to Kubernet'){
			steps {
				script {
					sh "sudo kubectl create -f kubernet.yml"
				}
			}
		}
	}
}
