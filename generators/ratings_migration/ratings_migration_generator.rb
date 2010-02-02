class RatingsMigrationGenerator < Rails::Generator::Base
  mandatory_options :source => File.join(File.dirname(__FILE__), '../../')

  def manifest
    record do |m|
      #m.migration_template 'migration.rb', 'db/migrate', :migration_file_name => 'create_ratings'
      m.migration_template 'db/migrate/57425_create_ratings.rb', 'db/migrate', :migration_file_name => 'create_ratings'
    end
  end
end
