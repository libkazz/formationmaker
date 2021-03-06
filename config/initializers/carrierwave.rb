CarrierWave.configure do |config|
  if ENV['S3_KEY']
    config.fog_credentials = {
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['S3_KEY'],
      :aws_secret_access_key => ENV['S3_SECRET'],
      :region                => ENV['S3_REGION']
    }
    config.storage = :fog
    config.fog_directory    = ENV['S3_BUCKET_NAME']
    config.fog_public       = true
    config.cache_dir = "#{Rails.root}/tmp/uploads" # To let CarrierWave work on heroku
  else
    config.storage = :file
  end
end
