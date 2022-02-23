pipeline{
	agent any
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
	}
}
