Rails.application.routes.draw do

  root :to => "static_pages#home" 
  devise_for :users
  resources :fields
  resources :backgrounds
  resources :team_members
  resources :gallery_categories do
    resources :galleries
  end
  match '/admin',   to: 'static_pages#admin', via: ['get', 'delete']
  match '/blog',   to: 'static_pages#blog', via: 'get'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
 
  match '/change_locale', to: 'static_pages#change_locale', via: 'get'
  
  match '/new_or_update_gallery', to: 'galleries#new_or_update_gallery', via: 'get'
  match '/sort', to: 'galleries#sort', via: 'get'

  match '/counter', to: 'test#counter', via: ['post', 'get']
  match '/recourse', to: 'test#recourse', via: ['post', 'get']
  match '/houses', to: 'test#houses', via: ['post', 'get']
  match '/additional_news', to: 'test#additional_news', via: ['post', 'get']
  match '/more_articles', to: 'test#more_articles', via: ['post', 'get']
  match '/district_data', to: 'test#district_data', via: ['post', 'get']
  match '/contest_data', to: 'test#contest_data', via: ['post', 'get']

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
