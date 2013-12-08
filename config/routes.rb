Mailer::Application.routes.draw do
  resources :people
  root :to => 'home#index'
  resource :contact_forms
end
