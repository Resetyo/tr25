class FieldsController < ApplicationController
  
  load_and_authorize_resource except: [:edit]

  def create
    @field = Field.new(field_params)
    @field.save
  end

  def edit
    @field = Field.find(params[:id])
  end

  def update
    @field = Field.find(params[:id])
    @field.update_attributes(field_params)
    
    if session[:locale] == "ru"
      redirect_to admin_path(locale: "ru")
    else
      redirect_to admin_path
    end
  end

  private

    def field_params
      params.require(:field).permit(:ru, :en)
    end
end