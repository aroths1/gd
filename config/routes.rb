GroupsyDaisy::Application.routes.draw do
  
  #root to: "static#index"
  root to: "trips#index"
  
  devise_for :users
  
  get "static/index"

  match 'orders/:id/new' => 'orders#new', :as => :new_order
  match 'trips/public/:id' => 'trips#public_show', as: :public_trip #use public_trip_url(trip_id)
  match 'trips/email_publicize_new/:id' => 'trips#email_publicize_new', as: :email_publicize #email_publicize_path(trip_id)
  match 'trips/email_publicize_create/:id' => 'trips#email_publicize_create', as: :email_publicize_create
  match 'trips/email_participants_new/:id' => 'trips#email_participants_new', as: :email_participants
  match 'trips/email_participants_create/:id' => 'trips#email_participants_create', as: :email_participants_create
  put 'line_items' => 'line_items#update', as: :update_line_items
  
  resources :orders


  resources :line_items


  resources :items


  resources :trips


  resources :groups


  resources :destination_specific_activities


  resources :activities


  resources :destinations


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action


  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
