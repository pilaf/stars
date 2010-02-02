module Stars::Rateable
  def self.included(base)
    base.has_many(:ratings, :as => :rateable)
    base.attr_readonly(:rating_average)
    base.send(:include, Stars::Rateable::InstanceMethods)
  end

  module InstanceMethods
    # Recalculate the average rating and save
    # it in column cache
    #
    def update_average_rating!
      self.class.update_all({:rating_average => ratings.average(:rating)}, {:id => id})
    end

    # Return a rating rounded by proximity to
    # full integers or half integers.
    #
    # E.g. 2.2 becomes 2.0, 2.4 becomes 2.5, etc
    #
    def rounded_rating
      return nil unless rating_average

      floor = rating_average.floor

      decimal_part = rating_average % 1

      decimal_part = if decimal_part < 0.33
        0
      elsif decimal_part < 0.66
        0.5
      else
        1
      end

      floor + decimal_part
    end
  end
end
