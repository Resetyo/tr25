class StaticPagesController < ApplicationController

  def home
    @galleries = Gallery.all.group_by {|c| c.category_id}
    session[:return_to] = request.original_url if request.get?
  end

  def blog
  end

  def admin
    @fields = Field.select(:id, :en, :ru)

    @bground1 = Background.find(1)
    
    @galleries = Gallery.all.group_by {|c| c.category_id}

    @gallery_categories = GalleryCategory.all
    @gallery_category = GalleryCategory.new
    @team_member = TeamMember.new

    team_member_count = TeamMember.count
    @tm = (team_member_count/3+1).to_i
    session[:return_to] = request.original_url if request.get?
  end

  def change_locale
    locale = session[:locale]
    if locale == 'ru'
      session[:locale] = 'en'
      redirect_to session[:return_to].split('?').first
    else
      session[:locale] = 'ru'
      redirect_to "#{session[:return_to]}?locale=ru"
    end
  end
end