Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/globally', as: 'rails_admin'
  devise_for :users
	resources :movies
  root to: "movies#index"
  resources :ratings
  resources :categories
	get 'movies/filter/:country', to:"movies#filter", as: :filter
  get 'hakkinda', to: "pages#about", as: :about
  get 'iletisim', to: "pages#contact", as: :contact

end
