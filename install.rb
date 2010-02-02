# Copy assets to main application
require 'rails_generator'
Rails::Generator::Base.instance(:stars_rating_assets).command(:create).invoke!
