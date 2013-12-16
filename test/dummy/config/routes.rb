Rails.application.routes.draw do

  mount Nav::Engine => "/nav"
  mount Auth::Engine => "/auth"
  mount Core::Engine => "/"
end
