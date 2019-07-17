pipeline{
	agent any
	stages{
		stage('Build docker image'){
			step {
				script {
					def scmVars = checkout([
						$class: 'GitSCM',
						doGenerateSubmoduleConfigurations: false,
						userRemoteConfigs: [[
							url: 'https://github.com/GuGu910/test.git'
						]],
						branches: [[name: '*/masters']]
					])
				sh "sudo app_flask/"
				sh "sudo docker build -f Dockerfile -t app_flask:${scmVars.GIT_COMMIT} ."
				}
			}
		}
	}
}
