# -*- encoding : utf-8 -*-
Teisotcl::Application.routes.draw do
  root :to => 'home#index'
  resources :participants do
    collection do
      get :dashboard, :edit_password
      post :update_password
    end
    member do
      get :edit_thesis, :show_thesis
    end
  end
  resources :experts do
    collection do
      get :dashboard, :edit_password
      post :update_password
    end
    resources :ratings do
      collection do
        get :unrated, :approved, :failure, :reserved, :standard
      end
    end
  end
  resources :articles
  match 'intro' => 'intro#index', :as => :intro
  match 'participant_signup' => 'participants#new', :as => :participant_signup, :via => [:get]
  match 'participant_signup' => 'participants#create', :as => :participant_signup, :via => [:post]
  match 'participant_signin' => 'sessions#new_participant', :as => :participant_signin, :via => [:get]
  match 'participant_signin' => 'sessions#create_participant', :as => :participant_signin, :via => [:post]
  match 'participant_signout' => 'sessions#destroy_participant', :as => :participant_signout
  match 'expert_signin' => 'sessions#new_expert', :as => :expert_signin, :via => [:get]
  match 'expert_signin' => 'sessions#create_expert', :as => :expert_signin, :via => [:post]
  match 'expert_signout' => 'sessions#destroy_expert', :as => :expert_signout
  namespace :admin do
    root :to => 'dashboard#index'
    resources :participants do
      member do
        get :reset_password
      end
      collection do
        get :search
      end
      resource :thesis do
        resources :ratings
      end
    end
    resources :theses
    resources :experts do
      collection do
        get :batched_new
        post :batched_create
      end
    end
    resources :articles
    resources :posters
    resources :users do
      member do
        get :reset_password
      end
    end
    resources :reviews
    resources :ratings do
      collection do
        get :batched_new
        post :batched_create
      end
    end
    resources :excels do
      collection do
        get :export_participants, :export_experts, :export_reviews
      end
    end
    match 'excels' => 'excels', :as => :excels
    match 'signin' => 'sessions#new', :as => :signin, :via => [:get]
    match 'signin' => 'sessions#create', :as => :signin, :via => [:post]
    match 'signout' => 'sessions#destroy', :as => :signout
    match 'edit_password' => 'users#edit_password', :as => :edit_password
    match 'update_password' => 'users#update_password', :as => :update_password, :via => [:post]
  end
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
