# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
FreshTomato::Application.initialize!

AWS::S3::DEFAULT_HOST = "s3-us-west-2.amazonaws.com"
