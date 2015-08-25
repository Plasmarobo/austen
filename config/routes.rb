HigginsCassidy::Application.routes.draw do


  get 'code/code_tags'
  post 'code/code_tags'
  
  get 'code/index'

  get 'code/show'

  get 'code/new'

  get 'code/edit'

  get 'code/create'
  post 'code/create'

  get 'code/update'
  post 'code/update'

  get 'code/destroy'

  get 'code/edit_tag'

  get 'code/update_tag'
  post 'code/update_tag'

  get 'code/new_tag'
  post 'code/new_tag'
  get 'code/create_tag'
  post 'code/create_tag'
  
  post 'code/tag_index'
  get 'code/tag_index'

  get 'code/show_tag'
  
  get 'code' => 'code#index'

  devise_for :admins
  devise_for :users
  get 'about' => 'static_pages#about'
  
  get 'wimap' => 'static_pages#wimap'
  scope '/clickwise' do
    get '/' => 'static_pages#clickwise', asset: "clickwise.html"
    get '/:asset' => 'static_pages#clickwise'
  end

  root to: "blog#index"
  resources :blog
  resources :blogposts

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
