Topdog::Application.routes.draw do

  resources :quizzes

  resources :histories

  resources :topics

  resources :categories

  resource :my_top_dog

  resources :games
  
  resources :answers

  resources :layouts

  resources :triviabuilders

  resources :jobs

  resources :questions do
    get 'answers', on: :member
  end

  devise_for :users
  root "pages#home"
  get "about" => "pages#about"
  get "legal" => "pages#legal"
  get "contact" => "pages#contact"
  get "triviamaker" => "pages#triviamaker"
  get "quizmaker" => "pages#quizmaker"
  get "triviahub" => "pages#triviahub"
  get "gameshub" => "gameshub#index"
  get "triviabuilders" => "triviabuilders#index"
  get "new_triviabuilders" =>"triviabuilders#new"
  get "lobby" => "pages#lobby"
  get "trivia" => "pages#trivia"
  get "scoreboard" => "scoreboard#index", as: :scoreboard
  get "gamequestion" => "questions#game"
  get "mytd" => "my_td#index", as: :mytd
  get "stack" => "pages#stack"
  get "reservation" => "pages#reservation"
  get "testhome" => "pages#testhome"

  namespace :api, defaults: { format: :json } do
    get 'start' => 'quiz#start'
    get 'show_question/:participation_id/:category_id' => 'quiz#show_question'
    get 'validate_answer/:participation_id/:index' => 'quiz#validate_answer'
    get 'update_rankings/:participation_id' => 'quiz#update_rankings'
    get 'skip_question/:participation_id' => 'quiz#skip_question'
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
