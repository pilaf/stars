module Stars::Controller
  class << self
    attr_writer :require_user_method, :current_user_method

    def require_user_method
      @require_user_method || :require_user
    end

    def current_user_method
      @current_user_method || :current_user
    end
  end
end
