module Stars::Model
  class << self
    attr_writer :user_class_name, :max_rating

    def user_class_name
      @user_class_name || 'User'
    end

    def max_rating
      @max_rating || 5
    end
  end
end
