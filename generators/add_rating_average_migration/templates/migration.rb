class AddRatingAverageTo<%= class_name.pluralize %> < ActiveRecord::Migration
  def self.up
    add_column :<%= table_name %>, :rating_average, :decimal, :precision => 6, :scale => 2
  end

  def self.down
    remove_column :<%= table_name %>, :rating_average
  end
end
