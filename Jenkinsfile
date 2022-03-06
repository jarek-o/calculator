pipeline{
	agent any

	triggers { pollSCM('5 * * * *') }

	stages{
		stage("Compile"){
			steps{
				sh "./mvnw compile"
				}
		}
		stage("Unit Test"){
			steps{
				sh "./mvnw test"
			}
		}
		stage("Code Coverage"){
			steps{
				sh "./mvnw -X test"
				publishHTML (target: [
					reportDir: 'target/site/jacoco/',
					reportFiles: 'index.html',
					reportName: "jacoco Report"
				])			

			}
		}
		stage("Static code analysis"){
			steps{
				sh "./mvnw site"
                                publishHTML (target: [
                               		reportDir: 'target/',
                                	reportFiles: 'checkstyle-result.xml',
                                	reportName: "Checkstyle Report"])
			}
		}
		stage("Package"){
			steps{
				sh "./mvnw package"
			}
		}
                stage("Docker Build"){
                        steps{
                                sh "sudo docker build -t localhost:5000/calculator ."
                        }
                }
                stage("Docker push"){
                        steps{
                                sh "docker push localhost:5000/calculator ."
                        }
                }

	}
}
