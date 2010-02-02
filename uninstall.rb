# Remove assets from main application
require Rails.root.join('config/environment')
require 'rails_generator'
Rails::Generator::Base.instance(:stars_rating_assets).command(:destroy).invoke!
