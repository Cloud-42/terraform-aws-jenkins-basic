node {
  stage('init') {
    echo "it ran"
    sh '''
      aws s3 ls
      terragrunt --version
      docker version
    '''  
  }
}
