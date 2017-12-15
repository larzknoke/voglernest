Rails.application.routes.draw do
  get 'bestellemail' => 'brotbestellscheins#bestellemail'
  put 'bst_auf_schein' => 'brotbestellscheins#bst_auf_schein'
  get 'schein_aus_bst' => 'brotbestellscheins#schein_aus_bst'

  resources :brotbestellscheins
  resources :brotbestellposis
  resources :brotbestellungs
  # get 'booking/index'
  # get 'bookings' => 'booking#index'
  # get 'booking/new'
  #
  # post 'booking/create'
  #
  # get 'booking/update'

  # get 'fewo/index'
  # get 'fewo/new'
  # get 'fewo/create'
  # get 'fewo/update'

  resources :brotsortes
  resources :mieters
  resources :fewos
  resources :bookings do
    member do
      get 'bestaetigen'
    end
  end

  get 'home/index'

  #
  # get 'mieter/index'
  # get 'mieter/new'
  # post 'mieter/create'
  # get 'mieter/create'
  # get 'mieter/update'

  get 'start/index'
  root 'start#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
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
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
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
