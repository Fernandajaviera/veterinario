Rails.application.routes.draw do

  resources :clientes do
    resources :pets do
      resources :pet_histories
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "clientes#index"
end
