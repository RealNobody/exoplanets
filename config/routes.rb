Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "/", controller: :exoplanets, action: :index

  resource :exoplanets, only: [] do
    collection do
      get :reload
    end
  end
end
