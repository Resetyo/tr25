class TestController < ApplicationController
  def counter
    if params[:first_cold].present?
      render :nothing => true, :status => 200, :content_type => 'text/html'
    else
      render :nothing => true, :status => 404, :content_type => 'text/html'
    end
  end
end
