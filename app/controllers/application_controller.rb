class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    admin_path
  end

  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  rescue_from CanCan::AccessDenied do |exception|
    render :file => "#{Rails.root}/public/403.html", 
            :status => 403, :layout => false
  end

  before_action :set_locale
  before_action :field_filling

  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end

  def field_filling
    @field_filling = Field.all.index_by(&:id)
  end

end