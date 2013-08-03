Jobsite::Application.routes.draw do
  get "tops/top"

  root :to => 'jobs#top'

  devise_for :c_managers, :controllers => { :sessions => "c_managers/sessions", :registrations => "c_managers/registrations" }

  devise_for :admins, :controllers => { :sessions => "admins/sessions", :registrations => "admins/registrations" }

  devise_for :users, :controllers => { :sessions => "users/sessions", :registrations => "users/registrations" }

  namespace :admins do
    resource :top do
      get 'top'
    end
    resources :companies do
      get 'search', :on => :collection
      resources :jobs do
        get 'search', :on => :collection
      end
      resource :c_manager
    end
  end

  resources :jobs do
    member do
      get 'show'
      post 'before_apply'
      post 'apply'
    end
    collection do
      get 'top'
      post 'list'
    end
  end

  resource :profile do
    get 'entry'
  end

  resources :applies
  resources :mails do
    collection do
      get 'lists'
      get 'reply'
      get 'check'
    end
  end
  
  resource :resume do
    get 'entry'
    get 'job_frame'
  end

  namespace :c_managers do
    resource :top do
      get 'top'
    end
    resource :company
    resources :jobs
    resources :mails do
      collection do
        get 'lists'
        get 'new_from_company'
        get 'check'
        get 'reply'
      end
    end
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
  # just remember to delete public

  # root :to => 'welcome#index'
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
