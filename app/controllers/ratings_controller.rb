class RatingsController < ApplicationController

  # Make sure we are logged in.
  #
  # The logic for this should be specified in the application
  # and thus we allow for configurable "require user" method
  # (generally called something like require_user,
  # require_logged_in, etc.).
  #
  before_filter Stars::Controller.require_user_method


  # Make sure we have an object to rate.
  #
  before_filter :find_rateable


  # This is the only action we need, used for both
  # creating and updating a rating (ratings are not deleted).
  #
  # Ratings are unique in the [user, rateable] scope, so
  # creating a rating twice will overwrite the old one.
  #
  def create
    @rating = @rateable.ratings.build(params[:rating])
    @rating.user = current_user

    if @rating.save
      respond_to do |format|
        format.html { render :nothing => true }
        format.json { render :json => @rating }
      end
    else
      respond_to do |format|
        format.html { render :nothing => true, :status => :bad_request }
        format.json { render :json => @rating, :status => :bad_request }
      end
    end
  end


private


  # Gets the current session's user using the method
  # specified in the controller configuration.
  #
  def current_user
    if Stars::Controller.current_user_method == :current_user
      super
    else
      send(Stars::Controller.current_user_method)
    end
  end


  # Finds the record being referenced.
  #
  def find_rateable

    # Try to find a params hash key named *_id
    rateable_key, rateable_id = *params.find { |key, value| key.to_s =~ /\A\w+_id\Z/ }

    # If nothing was found just respond with bad request
    raise unless rateable_key

    rateable_class = rateable_key.gsub(/_id\Z/, '').camelize.constantize

    # Make sure the referenced class inherits from ActiveRecord
    raise unless rateable_class.superclass == ActiveRecord::Base

    @rateable = rateable_class.find(rateable_id)

  rescue
    
    # If something goes awry, just respond with a bad request status
    render :nothing => true, :status => :bad_request

  end
end
