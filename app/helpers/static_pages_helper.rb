module StaticPagesHelper
  def lang(i)
    if I18n.locale == :en
      @field_filling[i].en
    else
      @field_filling[i].ru
    end
  end
end