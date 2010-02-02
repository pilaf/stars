class Rating < ActiveRecord::Base

  # The polymorphic rateable association
  #
  belongs_to :rateable, :polymorphic => true

  # The user class could be call something other
  # than 'User', so we allow configuration for it
  #
  belongs_to :user, :class_name => Stars::Model.user_class_name

  # All fields required
  #
  validates_presence_of :rateable_id
  validates_presence_of :rateable_type
  validates_presence_of :user_id
  validates_presence_of :rating

  # Make sure ratings are integers in the range from 1 to
  # the specified maximum rating in the configuration
  #
  validates_numericality_of :rating, :only_integer => true, :greater_than_or_equal_to => 1, :less_than_or_equal_to => Stars::Model.max_rating

  # Perform some upkeep after saving
  #
  after_create :delete_previous_rating
  after_create :update_rateable_average

  # Make sure only the rating is mass-assignable
  #
  attr_accessible :rating, :rational_rating

  def rational_rating=(ratio)
    ratio = ratio.to_f
    self.rating = ((Stars::Model.max_rating - 1) * ratio + 1).to_i
  end

private
  
  def delete_previous_rating
    self.class.delete_all(['rateable_type = ? AND rateable_id = ? AND user_id = ? AND id != ?', rateable_type, rateable_id, user_id, id])
  end

  def update_rateable_average
    rateable.update_average_rating!
  end
end
