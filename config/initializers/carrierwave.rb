unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_public = false
    config.fog_credentials = {
      provider: ENV['PROVIDER'],
      aws_access_key_id: ENV['AWS_ACCESS_KEY'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: ENV['REGION']
    }

    config.fog_directory  = 'rr-user-image'
    config.cache_storage = :fog
  end
end
