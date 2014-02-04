module Nav
  class NavigationCell < Cell::Rails
    include CanCan::ControllerAdditions
    include Core::ApplicationHelper
    helper Core::ApplicationHelper
    append_view_path 'app/views'

    cache :show, expires_in: 2.hours
    def show name, args = {}
      @nav_navigation = Navigation.find_by(name: name, locale: I18n.locale)
      args[:view] ? render(view: args[:view]) : render if @nav_navigation
    end
  end
end