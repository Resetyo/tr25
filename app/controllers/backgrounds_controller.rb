class BackgroundsController < ApplicationController
  
  load_and_authorize_resource

  def new
    @bground = Background.new
  end

  def create
    @bground = Background.new(bground_params)
    @bground.save
    redirect_to admin_path
  end

  def update
    @bground = Background.find(params[:id])
    @bground.update_attributes(bground_params)
    redirect_to admin_path
  end

  private

    def bground_params
      params.require(:background).permit(:id, :image)
    end
end
