class CreateRatings < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|

      # The actual rating value.
      # This is an integer for individual ratings
      #
      t.integer :rating, :null => false

      # Polymorphic association with rateable
      #
      t.references :rateable, :polymorphic => true

      # User association
      #
      t.references :user

      # We don't need updated_at here,
      # so we use this instead of t.timestamps
      #
      t.datetime :created_at 

    end

    add_index :ratings, [:rateable_type, :rateable_id, :user_id]
  end

  def self.down
    drop_table :ratings
  end
end
