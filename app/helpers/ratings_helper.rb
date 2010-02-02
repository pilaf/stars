module RatingsHelper
  def stars_rating_assets
    stars_rating_stylesheets + stars_rating_javascripts
  end

  def stars_rating_stylesheets
    stylesheet_link_tag('stars_rating/stars_rating')
  end

  def stars_rating_javascripts
    javascript_include_tag('stars_rating/stars_rating')
  end

  def rating_for(object)
    # Check if this object has been rated before
    unless object.rounded_rating.nil?
      rating_class = "rating_#{object.rounded_rating.floor.to_i}"
      rating_class << '_half' if (object.rounded_rating % 1) > 0
    else
      rating_class = ''
    end

    content_tag(:button, '', {
      :class            => "stars_rating #{rating_class}".strip,
      'data-rating-url' => url_for([object, :rating])
    })
  end
end
