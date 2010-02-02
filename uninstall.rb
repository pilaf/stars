require Rails.root.join('config/environment')
require 'rails_generator'

# Remove assets and config from application
Rails::Generator::Base.instance(:stars_rating_assets).command(:destroy).invoke!
Rails::Generator::Base.instance(:stars_rating_config).command(:destroy).invoke!
