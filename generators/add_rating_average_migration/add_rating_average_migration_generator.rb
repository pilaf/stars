class AddRatingAverageMigrationGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      m.migration_template 'migration.rb', 'db/migrate', :migration_file_name => "add_rating_average_to_#{table_name}"
    end
  end
end
