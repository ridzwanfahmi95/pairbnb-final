Rails.application.routes.draw do
 

#>>>>>>>>>>>>>>>>>>>>>         pairbnb-final        <<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
#=========================== by MingXiang XD ===================================
# get 'static_pages/landing'

  resources :users, only: [:index, :show, :edit, :update]
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  # resources :users, controller: "clearance/users", only: [:create] do
  #   resource :password,
  #     controller: "clearance/passwords",
  #     only: [:create, :edit, :update]
  # end
  
  resources :users do     
    resource :password,  
       controller: "clearance/passwords",
       only: [:create, :edit, :update, :show]   
  end

  # get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  # delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  # get "/sign_up" => "clearance/users#new", as: "sign_up"
# get 'users' => 'welcome#index'
get "/auth/:provider/callback" => "sessions#create_from_omniauth"
get "/home" => "listings#index"
# get "add_list/:id" => "listing#_form" 
#===============================================================================
  root 'listings#index' #similar with 'static_pages/landing'(ming xiang)
  
  #cun!
  resources :listings do 
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:destroy]

# get 'braintree/new'

# get ""
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

#     Prefix Verb   URI Pattern                             Controller#Action
#             users GET    /users(.:format)                        users#index
#         edit_user GET    /users/:id/edit(.:format)               users#edit
#               user GET    /users/:id(.:format)                    users#show
#                   PATCH  /users/:id(.:format)                    users#update
#                   PUT    /users/:id(.:format)                    users#update
#         passwords POST   /passwords(.:format)                    clearance/passwords#create
#       new_password GET    /passwords/new(.:format)                clearance/passwords#new
#           session POST   /session(.:format)                      clearance/sessions#create
#     user_password POST   /users/:user_id/password(.:format)      clearance/passwords#create
# edit_user_password GET    /users/:user_id/password/edit(.:format) clearance/passwords#edit
#                   GET    /users/:user_id/password(.:format)      clearance/passwords#show
#                   PATCH  /users/:user_id/password(.:format)      clearance/passwords#update
#                   PUT    /users/:user_id/password(.:format)      clearance/passwords#update
#                   GET    /users(.:format)                        users#index
#                   POST   /users(.:format)                        users#create
#           new_user GET    /users/new(.:format)                    users#new
#                   GET    /users/:id/edit(.:format)               users#edit
#                   GET    /users/:id(.:format)                    users#show
#                   PATCH  /users/:id(.:format)                    users#update
#                   PUT    /users/:id(.:format)                    users#update
#                   DELETE /users/:id(.:format)                    users#destroy
#                   GET    /auth/:provider/callback(.:format)      sessions#create_from_omniauth
#               home GET    /home(.:format)                         listings#index
#               root GET    /                                       listings#index
#           listings GET    /listings(.:format)                     listings#index
#                   POST   /listings(.:format)                     listings#create
#       new_listing GET    /listings/new(.:format)                 listings#new
#       edit_listing GET    /listings/:id/edit(.:format)            listings#edit
#           listing GET    /listings/:id(.:format)                 listings#show
#                   PATCH  /listings/:id(.:format)                 listings#update
#                   PUT    /listings/:id(.:format)                 listings#update
#                   DELETE /listings/:id(.:format)                 listings#destroy
#           bookings GET    /bookings(.:format)                     bookings#index
#                   POST   /bookings(.:format)                     bookings#create
#       new_booking GET    /bookings/new(.:format)                 bookings#new
#       edit_booking GET    /bookings/:id/edit(.:format)            bookings#edit
#           booking GET    /bookings/:id(.:format)                 bookings#show
#                   PATCH  /bookings/:id(.:format)                 bookings#update
#                   PUT    /bookings/:id(.:format)                 bookings#update
#                   DELETE /bookings/:id(.:format)                 bookings#destroy
#                   POST   /passwords(.:format)                    clearance/passwords#create
#                   GET    /passwords/new(.:format)                clearance/passwords#new
#                   POST   /session(.:format)                      clearance/sessions#create
#                   POST   /users/:user_id/password(.:format)      clearance/passwords#create
#                   GET    /users/:user_id/password/edit(.:format) clearance/passwords#edit
#                   PATCH  /users/:user_id/password(.:format)      clearance/passwords#update
#                   PUT    /users/:user_id/password(.:format)      clearance/passwords#update
#                   POST   /users(.:format)                        clearance/users#create
#           sign_in GET    /sign_in(.:format)                      clearance/sessions#new
#           sign_out DELETE /sign_out(.:format)                     clearance/sessions#destroy
#           sign_up GET    /sign_up(.:format)                      clearance/users#new