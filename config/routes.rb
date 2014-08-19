Rails.application.routes.draw do
  devise_for :users,  controllers: {
    sessions: 'sessions',
    registrations: 'registrations'
  }
  root 'main#index'

  get '/admin' => 'admin#index', as: :admin
  namespace :admin do
    resources :users, except: [:create, :new]
  end

  unless Rails.application.config.consider_all_requests_local
    get '/404' => 'errors#404'
    get '/422' => 'errors#500'
    get '/500' => 'errors#500'
  end
end
