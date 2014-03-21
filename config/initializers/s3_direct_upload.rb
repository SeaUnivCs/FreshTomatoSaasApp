S3DirectUpload.config do |c|
  c.access_key_id = "AKIAJWFYDWFXWXKZSCIA"
  c.secret_access_key = "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"
  c.bucket = "freshtomato"
  c.region = "s3"
  c.url = "https://#{c.bucket}.s3.amazonaws.com/"
end
