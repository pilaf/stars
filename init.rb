# Extend the routes mapper with the ratings method
ActionController::Routing::RouteSet::Mapper.send(:include, Stars::Routes)

# Extend ActiveRecord with the is_rateable class method
ActiveRecord::Base.send(:extend, Stars::ActiveRecordExtension)

# Include helper
ActionView::Base.send(:include, RatingsHelper)

%w{controllers models helpers}.each do |d|
  ActiveSupport::Dependencies.load_once_paths.delete(File.join(File.dirname(__FILE__), 'app', d))
end
