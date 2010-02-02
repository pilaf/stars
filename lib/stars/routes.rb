module Stars::Routes

  # We need to allow attributes as the routes
  # mapper internally uses with_options when
  # creating nested routes, and so we need to
  # merge those options
  #
  def ratings(*args)
    options = args.extract_options!
    self.resource(:rating, options.merge(:only => :create))
  end

end
