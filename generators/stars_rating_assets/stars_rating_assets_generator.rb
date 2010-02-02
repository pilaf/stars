class StarsRatingAssetsGenerator < Rails::Generator::Base
  mandatory_options :source => File.join(File.dirname(__FILE__), '../../')

  ASSETS = %w{
    public/javascripts/stars_rating/stars_rating.js
    public/stylesheets/stars_rating/stars_rating.css
    public/images/stars_rating/stars_rating.png
  }.freeze

  ASSET_DIRECTORIES = ASSETS.map {|f| File.dirname(f)}.uniq.freeze

  def manifest
    record do |m|

      ASSET_DIRECTORIES.each do |d|
        m.directory d
      end

      ASSETS.each do |f|
        m.file f, f, :collision => :ask
      end

    end
  end
end
