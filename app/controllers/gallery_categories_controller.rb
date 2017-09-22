class GalleryCategoriesController < ApplicationController

  load_and_authorize_resource except: [:new, :edit]

  def new
    @gallery_category = GalleryCategory.new
    @gallery_category.galleries.build
  end

  def create
    @gallery = Gallery.new
    @gallery_category = GalleryCategory.new(gallery_category_params)
    @gallery_category.save

    if params[:gallery_category][:galleries_attributes]
      gallery_image = params[:gallery_category][:galleries_attributes]["0"][:image]
      render text: {
        meta: { status: 200, msg: "OK" }, 
        response: { avatar: gallery_image, 
                        id: @gallery_category.galleries.last.id }
      }.to_json
    else
      redirect_to admin_path
    end
  end

  def edit
    @current_gallery_category = GalleryCategory.find(params[:id])
    @gallery_category = GalleryCategory.new
    @gallery = Gallery.new
  end

  def update
    @gallery_category = GalleryCategory.find(params[:id])
    @gallery_category.update_attributes(gallery_category_params)
    redirect_to admin_path
  end

  def destroy
    GalleryCategory.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to admin_path }
    end
  end

  private

    def gallery_category_params
      params.require(:gallery_category).permit(:ru_title, :title, 
                                          :ru_subtitle, :subtitle, galleries_attributes: [:id, :image, :comment, :_destroy])
    end
end