module Nav
  class NavigationCell < Cell::Rails
    helper NavigationHelper

    cache :show, expires_in: 2.hours do |cell, name, options|
      "#{name} #{I18n.locale} #{options[:view] if options}"
    end

    def show name, options = {}
      @nav_navigation = Navigation.find_by(name: name, locale: I18n.locale)
      options[:view] ? render(view: options[:view]) : render if @nav_navigation
    end
  end
end