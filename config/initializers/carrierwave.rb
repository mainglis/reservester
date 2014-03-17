CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV['AWS_KEY_ID'],                        # required
    :aws_secret_access_key  => ENV['AWS_KEY_SECRET'],                        # required
    :region                 => 'eu-east-1',                  # optional, defaults to 'us-east-1'
    # :host                   => 's3.example.com',             # optional, defaults to nil
    :endpoint               => 'http://s3.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = 'reservester54'                     # required
  # config.fog_public     = false                                   # optional, defaults to true
  # config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end