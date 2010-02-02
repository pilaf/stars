require Rails.root.join('config/environment')
require 'rails_generator'

# Copy assets and config to application
Rails::Generator::Base.instance(:stars_rating_assets).command(:create).invoke!
Rails::Generator::Base.instance(:stars_rating_config).command(:create).invoke!
