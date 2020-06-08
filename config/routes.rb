Rails.application.routes.draw do
  get 'dashboard/index'
  resource :tokens, only: [:create]
  post 'tokens/login'
end
