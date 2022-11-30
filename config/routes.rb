Rails.application.routes.draw do
  resources :portfolios
  resources :blogs
  get 'contact', to: "pages#contact"
  get 'about', to: "pages#about"
  root "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
