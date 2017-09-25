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
    8.times do
      houses << rand 100
    end

    # render json: { houses: houses }, :'Access-Control-Allow-Headers' => 'accept, content-type'
    render :nothing => true, :status => 200, :'Access-Control-Allow-Headers' => 'accept, content-type', :content_type => 'text/html'
  end

end
