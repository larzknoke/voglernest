Rails.application.routes.draw do

  resources :kategories
  resources :produkts
  resources :warenkorbpositions
  resources :warenkorbs
  resources :bestellpositions
  resources :bestellungs
  resources :feeds do 
    member do
      delete :delete_image_attachment
    end
    get 'details', to: 'feeds#details'
  end
  
  # LOGIN & SESSION
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  get "logout" => "sessions#destroy"
  get "register" => "users#new"
  post "users" => "users#create"

  get "admin" => "bookings#dashboard"
  get "bestellemail" => "brotbestellscheins#bestellemail"
  put "bst_auf_schein" => "brotbestellscheins#bst_auf_schein"
  get "schein_aus_bst" => "brotbestellscheins#schein_aus_bst"
  get "standard" => "brotbestellungs#standard"
  post "contact" => "home#contactmail"
  post "anfrage_form" => "anfrages#create"
  get "packzettel" => "brotbestellscheins#packzettel"
  get "packzettel_show/:datum" => "brotbestellscheins#packzettel_show"


  resources :brottyps
  resources :openhours
  resources :brotbestellscheins
  resources :brotbestellposis
  resources :brotbestellungs do
    collection { get 'admin_order' }
  end
  resources :brotsortes
  resources :mieters
  resources :fewos
  resources :bookings do
    member do
      get "bestaetigen"
    end
    collection { get 'dashboard' }
  end
  resources :anfrages do
    get "antwort" => "anfrages#antwort"
  end

  get "home/index"
  get "home/hof"
  get "home/biogas"
  get "home/ausbildung"
  get '/home/ferienwohnung', to: 'home#fw', as: "home_fw"
  get "home/getcalendardates"
  get "home/hofladen"
  get "home/kontakt"
  get "home/thanks"

  get "start/index"
  root "home#index"


  ############
  ### Shop
  ############
  get "shop" => "shop#index", as: :shop
  get "shop/produktliste" => "shop#produktliste"
  get "shop/produkt" => "shop#produkt"
  get "shop/warenkorb" => "shop#warenkorb"
  get "shop/kasse" => "shop#kasse"





  
  #unless Rails.application.config.consider_all_requests_local
  #  # having created corresponding controller and action
  #  get '*path', to: 'errors#error_404', via: :all
  #end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root "welcome#index"

  # Example of regular route:
  #   get "products/:id" => "catalog#view"

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get "products/:id/purchase" => "catalog#purchase", as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get "short"
  #       post "toggle"
  #     end
  #
  #     collection do
  #       get "sold"
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get "recent", on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post "toggle"
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
