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
					sh "sudo docker build -f Dockerfile -t app_flask:${scmVars.GIT_COMMIT} ./app_flask"
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
					sh "sudo docker login -u ${params.REGISTRY_USERNAME} -p ${params.REGISTRY_TOKEN} ${REGION}.ocir.io"
					sh "sudo docker tag app_flask:${scmVars.GIT_COMMIT} ${params.REPO_PATH}/app_flask:${scmVars.GIT_COMMIT}"
					sh "sudo docker push ${params.REPO_PATH}/app_flask:${scmVars.GIT_COMMIT}"
					writeFile file: '/tmp/git_commit', text: "${scmVars.GIT_COMMIT}"
					writeFile file: '/tmp/repo', text: "${OCIR_PATH}"  // ${OCIR_PATH} == <REGION>.ocir.io/<TENANCY>/<REPO_NAME> 
				}
			}
		}
	}
}
