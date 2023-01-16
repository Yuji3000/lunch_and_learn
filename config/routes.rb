Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :recipes, only: [:index] do
      end
    end
  end

  
  namespace :api do
    namespace :v1 do
      resources :learning_resources, only: [:index] do
      end
    end
  end
end
