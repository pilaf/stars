namespace :stars do
  desc 'Installs the Stars ratings migration'
  task :migrations => 'db/migrate/57425_create_ratings.rb'

  desc 'Installs all Stars assets (JS, CSS and images)'
  task :assets => [:javascripts, :stylesheets, :images]

  desc 'Installs the default Stars javascript (Prototype based)'
  task :javascripts => 'public/javascripts/stars_rating/stars_rating.js'

  desc 'Installs the default Stars stylesheets'
  task :stylesheets => 'public/stylesheets/stars_rating/stars_rating.css'

  desc 'Installs the default Stars images'
  task :images => 'public/images/stars_rating/stars_ratings.png'

  lib_base_path = Pathname.new(File.join(File.dirname(__FILE__), '..')).cleanpath

  # Define generic file tasks for each asset:
  #
  %w{

    db/migrate/57425_create_ratings.rb

    public/javascripts/stars_rating/stars_rating.js
    public/stylesheets/stars_rating/stars_rating.css
    public/images/stars_rating/stars_ratings.png

  }.each do |dest|
    src = lib_base_path.join(dest).to_s

    file dest => src do |a|
      FileUtils.copy(src, dest)
    end
  end
end
