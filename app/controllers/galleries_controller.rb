class GalleriesController < ApplicationController
  
  load_and_authorize_resource

  def create
    @gallery = Gallery.new(gallery_params)
    @gallery.image = params[:gallery][:image]
    @gallery.save

    render text: {
      meta: { status: 200, msg: "OK" }, 
      response: { avatar: @gallery.image, 
                      id: @gallery.id
           }
    }.to_json
  end

  def new_or_update_gallery
    @gallery = Gallery.new
    @gl = Gallery.find(params[:id])
    @gallery_category = GalleryCategory.find(@gl.category_id)
  end

  def update
    @gallery = Gallery.find(params[:id])
    @gallery.image = params[:gallery]["edit_#{params[:id]}"][:image]
    @gallery.save
    
    render text: {
      meta: { status: 200, msg: "OK" }, 
      response: { avatar: @gallery.image }
    }.to_json
  end

  def sort
    @item = Gallery.find(params[:item])
    @gc = @item.category_id
    @gallery = Gallery.new
    @gallery_items = Gallery.where(category_id: @item.category_id).where.not(id: @item.id)
    @item.sort = @gallery_items.first.sort-1
    @item.save

    respond_to do |format|
      format.js
      format.html { redirect_to admin_path }
    end
  end

  def destroy
    @g = params[:id]
    Gallery.find(params[:id]).destroy

    respond_to do |format|
      format.js
      format.html { redirect_to admin_path }
    end
  end

  private

    def gallery_params
      params.require(:gallery).permit!#(:comment, :category_id, :sort, :image, :edit_9)
    end


end
