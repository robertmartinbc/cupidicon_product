CupidiconProduct::Application.routes.draw do

  get "submissions/new"
  
   get "user/available"

  get "user/engaged"

  get "assignments/reauthorization"

  get "assignments/resubmit"

  get "assignments/revision"

  get "assignments/published"

  get "assignments/authorize"

  get "assignments/write"

  devise_for :users

  resources :users, only: [:show] # create a route for users#show

  resources :assignments do 
    resources :submissions
  end

  resources :submissions 
  
  match "new" => 'submissions#new', via: :get

  match "need_content" => 'welcome#need_content', via: :get

  match "write_content" => 'welcome#write_content', via: :get

  match "loves_lexicon" => 'welcome#loves_lexicon', via: :get

  match "about" => 'welcome#about', via: :get

  root :to => 'welcome#index'

  post "assignments/:id/renew", to: 'assignments#renew'

  post "assignments/:id/cancel", to: 'assignments#cancel'

  post "assignments/:id/write", to: 'assignments#write'

  post "assignments/:id/authorize", to: 'assignments#authorize'

  post "assignments/:id/published", to: 'assignments#published'

  post "assignments/:id/reject", to: 'assignments#reject'

  post "assignments/:id/resubmit", to: 'assignments#resubmit'

  post "assignments/:id/revision", to: 'assignments#revision'

  post "assignments/:id/reauthorization", to: 'assignments#reauthorization'

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
