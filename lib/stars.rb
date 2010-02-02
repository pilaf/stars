module Stars
  class << self
    # Convenience method for prettier configuration files
    #
    def config
      yield self
    end

    # Convenience method for prettier configuration files
    #
    def controller
      self::Controller
    end

    # Convenience method for prettier configuration files
    #
    def model
      self::Model
    end
  end
end
