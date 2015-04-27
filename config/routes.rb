Rails.application.routes.draw do

  devise_for :users, :skip => [:registrations]
  resources :users do
    #collection ścieżki do których nie przesyłamy id
    collection do 
      get :show_profile
      get :edit_profile
      get 'edit_profile/password' => 'users#change_password', :as => :change_password
      patch 'edit_profile/password' => 'users#update'

      get 'edit_profile/delete/' => 'users#destroy_confirm', :as => :destroy_confirm
      patch 'edit_profile/delete/' => 'users#destroy_with_password', :as => :destroy
    end
    #member  ścieżki do który przesyłamy id
    member do
      get 'edit/password' => 'users#change_users_password', :as => :change_users_password
      patch 'edit/password' => 'users#update'
      get 'edit/delete/' => 'users#destroy_confirm', :as => :destroy_user_confirm
      patch 'edit/delete/' => 'users#destroy_with_password', :as => :destroy_user
    end
  end

  resources :namespaces do
    #collection ścieżki do których nie przesyłamy id
    collection do 
       
    end
    #member  ścieżki do który przesyłamy id
    member do
    
    end
  end
  resources :projects do
    collection do 
      
    end
    member do

      resources :tasks, param: :task_id
      
    end
  end

  root :to => "users#index"
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
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
