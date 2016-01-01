Rails.application.routes.draw do
  # Public Routes
  root                      'main#index'
  get     'about'           => 'main#about'
  get     'portfolio'       => 'main#portfolio'
  get     'contact'         => 'main#contact'
  post    'contact'         => 'main#message'

  # Backend Routes
  get     'login'           => 'sessions#new'
  post    'login'           => 'sessions#create'
  delete  'logout'          => 'sessions#destroy'
  get     'admin'           => 'admin#index'
  get     'admin/messages', to: 'admin#messages', as: 'admin_messages'
end
