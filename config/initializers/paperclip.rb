Paperclip::Attachment.default_options[:s3_host_name] = 's3.amazonaws.com'
Paperclip.interpolates(:s3_url) { |attachment, style|
  "#{attachment.s3_protocol}://s3-us-west-2.amazonaws.com/#{attachment.bucket_name}/#{attachment.path(style).gsub(%r{^/},"")}"
}
