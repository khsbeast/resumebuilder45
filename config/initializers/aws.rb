Aws.config[:credentials] = Aws::Credentials.new(
  ENV['BUCKETEER_AWS_ACCESS_KEY_ID'],
  ENV['BUCKETEER_AWS_SECRET_ACCESS_KEY']
)
Aws.config[:region]      = 'us-east-1'
Aws.config[:name]        = 's3-us-east-resumebuilder'

S3 = Aws::S3::Client.new
