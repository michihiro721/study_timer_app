Rails.application.routes.draw do
  resources :timers, only: [:new, :create, :show] do
    member do
      post 'start'
      patch 'stop'
    end
    collection do
      get 'study', to: 'timers#study', as: 'study'
      delete 'reset_total_duration', to: 'timers#reset_total_duration', as: 'reset_total_duration' # 累計学習時間をリセットする
      post 'reset_stamps', to: 'timers#reset_stamps', as: 'reset_stamps' # スタンプ数をリセットする
      delete 'reset_independent_total_duration', to: 'timers#reset_independent_total_duration', as: 'reset_independent_total_duration' # 独立した累計学習時間をリセットする
    end
  end

  root 'timers#new'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end