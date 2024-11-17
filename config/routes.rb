Rails.application.routes.draw do
  # ルートパスにタイマーの新規作成ページを設定
  root 'timers#new'

  # タイマーリソースのルーティング
  resources :timers, only: [:create, :show] do
    member do
      post 'start'
      patch 'stop'
    end
    collection do
      delete 'reset_total_duration', to: 'timers#reset_total_duration', as: 'reset_total_duration' # 累計学習時間をリセットする
      post 'reset_stamps', to: 'timers#reset_stamps', as: 'reset_stamps' # スタンプ数をリセットする
      delete 'reset_independent_total_duration', to: 'timers#reset_independent_total_duration', as: 'reset_independent_total_duration' # 独立した累計学習時間をリセットする
    end
  end

  # カスタムパスの設定
  get 'study', to: 'timers#study', as: 'study'

  # アプリケーションのヘルスチェック
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA関連のルート
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end