class TestController < ApplicationController
  def counter
    if params[:first_cold].present?
      render :nothing => true, :status => 200, :'Access-Control-Allow-Headers' => 'accept, content-type', :content_type => 'text/html'
    else
      render :nothing => true, :status => 404, :content_type => 'text/html'
    end
  end

  def recourse
    render :nothing => true, :status => 200, :'Access-Control-Allow-Headers' => 'accept, content-type', :content_type => 'text/html'
  end

  def houses
    houses = []
    8.times do |i|
      houses << rand(100)
    end

    render json: { houses: houses }, :'Access-Control-Allow-Headers' => 'accept, content-type'
  end

  def additional_news
    page = params['page'].to_i
    per_page = params['per_page'].to_i
    news = []
    news_count = 19
    news_count.times do |i|
      news << { id: i, title: Faker::StarWars.quote, date: Faker::Date.between(2.days.ago, Date.today) }
    end
    news[5]['video'] = "https://www.youtube.com/watch?v=yDK0NNfALc4"
    paginated_news = news[ (page - 1) * per_page..page * per_page - 1 ]
    news_left = news_count - per_page * page
    news_left = 0 if news_left < 0

    render json: { news: paginated_news, news_left: news_left }
  end

end
