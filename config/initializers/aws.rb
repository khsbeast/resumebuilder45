Aws.config[:credentials] = Aws::Credentials.new(
  ENV['AWS_BUCKET'],
  ENV['BUCKETEER_AWS_ACCESS_KEY_ID'],
  ENV['BUCKETEER_AWS_SECRET_ACCESS_KEY']
)
Aws.config[:region]      = 'us-east-1'

S3 = Aws::S3::Client.new
