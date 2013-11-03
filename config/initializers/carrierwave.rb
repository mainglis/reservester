CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['AWS_KEY_ID'],
    :aws_secret_access_key  => ENV['AWS_KEY_SECRET'],
  }

  config.fog_directory  = "reservester_#{Rails.env}"
end
