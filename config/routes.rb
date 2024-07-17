Rails.application.routes.draw do
  resources :barangays do
    resources :barangay_puroks, as: "puroks"
  end
  resources :vehicles do
    resources :vehicle_bundles, except: :show, as: "bundles"
  end
  resources :bundles do
    resources :bundle_items, except: :show, as: "items"
  end
  resources :items

  # Login-related routes
  get "login", to: "login#view"
  post "login", to: "login#authenticate", as: "auth"
  post "logout", to: "login#logout"

  get "dispatch", to: "dashboard#vehicle_dispatch"
  get "calculate", to: "dashboard#calculate"
  get "calc_bundle", to: "dashboard#calculate_bundle"
  get "calc_dispatch", to: "dashboard#calculate_dispatch"
  get "dispatch_load", to: "dashboard#dispatch_load"
  get "dispatch_unload", to: "dashboard#dispatch_unload"

  # Defines the root path route ("/")
  root "dashboard#index"
end