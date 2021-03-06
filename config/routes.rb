Rails.application.routes.draw do
  
  get 'value_prop/new'

  get 'value_prop/edit'

  get 'value_prop/update'

  get 'comments/new'

  get 'comments/create'

  get 'password_resets/new'

  get 'password_resets/edit'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create' 
  delete 'logout'  => 'sessions#destroy'
  #delete 'destroy' => 'users#destroy'

  get 'users/new'

  #get 'static_pages/home'

  get 'help' => 'static_pages#help'

  get 'about' => 'static_pages#about'

  get 'contact' => 'static_pages#contact'

  post 'sendcontact'   => 'static_pages#sendcontact'

  get 'signup'=>'users#new'

  get 'register' =>'organisations#new'



  root 'static_pages#home'

  resources:users
  resources:organisations
  resources:tasks
  resources:comments
  resources:value_props
  resources:tasks do
    resources :comments
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :organisations do 
    resources :users 
    resources :tasks
    resource :value_prop
  end

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
