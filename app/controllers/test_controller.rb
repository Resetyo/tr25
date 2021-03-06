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

    render json: { news: paginated_news, news_left: news_left }, :'Access-Control-Allow-Headers' => 'accept, content-type'
  end

  def more_articles
    page = params['page'].to_i
    per_page = params['per_page'].to_i
    news = []
    news_count = 19
    news_count.times do |i|
      news << { 
        id: i, 
        title: Faker::StarWars.quote, 
        date: Faker::Date.between(2.days.ago, Date.today),
        image: Faker::Placeholdit.image("450x250") }
    end
    news[5]['video'] = "https://www.youtube.com/watch?v=yDK0NNfALc4"
    paginated_news = news[ (page - 1) * per_page..page * per_page - 1 ]
    news_left = news_count - per_page * page
    news_left = 0 if news_left < 0

    render json: { news: paginated_news, news_left: news_left }, :'Access-Control-Allow-Headers' => 'accept, content-type'
  end

  def district_data
    data =  { phones: [
                {
                  title: "Приемная",
                  phone: "275-17-51"
                },
                {
                  title: "Вторая приемная",
                  phone: "275-17-51"
                }
              ],
              worktime: [
                "В будни с 18:00 до 7:00",
                "В выходные и праздничные дни &ndash; круглосуточно."
              ]
            }
    render json: data, :'Access-Control-Allow-Headers' => 'accept, content-type'
  end

  def contest_data
    data =  { text: "Желающие принять участие в отборе, должны направить свои предложения для отбора по адресу: г. Красноярск, ул. Алексеева, д.49, кабинет 10-01.",
              links: [
                {
                  title: "Приемная",
                  path: "path"
                },
                {
                  title: "Вторая приемная",
                  path: "path"
                }
              ],
              thumbs: [
                "budget" => [
                  {
                    title: "Приемная",
                    links: [
                      {
                        title: "Приемная",
                        path: "path1"
                      },
                      {
                        title: "Вторая приемная",
                        path: "path2"
                      }
                    ],
                    download_all: "5fb96c16a319a85330b9f5e23b3d71e2"
                  },
                  {
                    title: "Вторая приемная",
                    links: [
                      {
                        title: "Приемная",
                        path: "path3"
                      },
                      {
                        title: "Вторая приемная",
                        path: "path4"
                      }
                    ],
                    download_all: "844a7744271c7931e74c7ae27f65fef2"
                  }
                ]
              ]
            }
    render json: data, :'Access-Control-Allow-Headers' => 'accept, content-type'
  end

end
