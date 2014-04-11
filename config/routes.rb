Reservester::Application.routes.draw do
  devise_for :users do 
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'restaurants#index'

  # devise_for :users do
  #   get '/users/sign_out' => 'devise/sessions#destroy'   
  # end

  # root to: "main#dashboard", as: "authenticated_root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get '/dashboard' => 'users#dashboard'
  get '/my-stars' => 'users#my_stars', as: :my_stars

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
    resources :restaurants do
      resources :reservations 
    end

    resources :restaurants do 
      resources :stars, :only => ['new', 'create']
      put :star, on: :member
    end

    resources :categories

    resource :reviews

    # This doesn't work!
    # resources :stars do 
    #   get 'new' #new /restaurants/:id/stars/new
    #   get 'create' #create /restaurants/:id/stars
    # end


    
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
