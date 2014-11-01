Rails.application.routes.draw do
  devise_for :users


  #Mobile Routes Interface
    #Post
    post 'mobile_interface/new_user' => "mobile_interface#new_user", as: "mobile_new_user"
    post 'mobile_interface/get_session' => "mobile_interface#new_session", as: "mobile_session"
    post 'mobile_interface/get_infos' => "mobile_interface#get_places_list", as: "mobile_place_list"
    post 'mobile_interface/update_place' => "mobile_interface#update_place_info", as: "update_place"
    post 'mobile_interface/new_place' => "mobile_interface#new_place", as: "new_place"
    post 'mobile_interface/update_product_info' => "mobile_interface#update_product_info", as: "update_product"
    post 'mobile_interface/add_product' => "mobile_interface#add_product", as: "add_product"

    #Get
    get 'mobile_interface/get_place' => "mobile_interface#get_place_info", as: "mobile_place_info"


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
