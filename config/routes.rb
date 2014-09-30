Rails.application.routes.draw do
  root to: 'visitors#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
