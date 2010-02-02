module RatingsHelper
  def stars_rating_assets
    stars_rating_stylesheets + stars_rating_javascripts
  end

  def stars_rating_stylesheets
    stylesheet_link_tag('stars_rating')
  end

  def stars_rating_javascripts
    javascript_include_tag('stars_rating')
  end

  def rating_for(object)
    rating_class = "rating_#{object.rounded_rating.floor.to_i}"
    rating_class << '_half' if (object.rounded_rating % 1) > 0

    content_tag(:button, '', {
      :class            => "stars_rating #{rating_class}",
      'data-rating-url' => url_for([object, :rating])
    })
  end
end
