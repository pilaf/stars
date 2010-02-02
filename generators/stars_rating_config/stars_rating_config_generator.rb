class StarsRatingConfigGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.file 'config.rb', 'config/initializers/stars_rating.rb', :collision => :ask
    end
  end
end
