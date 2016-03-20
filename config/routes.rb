Rails.application.routes.draw do
	resources :movies
  root to: "movies#index"
	get 'movies/filter/:country', to:"movies#filter", as: :filter
  get 'hakkinda', to: "pages#about", as: :about
  get 'iletisim', to: "pages#contact", as: :contact

end
