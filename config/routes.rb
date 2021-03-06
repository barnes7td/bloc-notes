Rails.application.routes.draw do
  resources :notes do
    collection do
      get "/upload/new", to: "notes#new_upload", as: "new_upload"
      post "/upload", to: "notes#upload", as: "upload"
      post "/search", to: "notes#search", as: "search"
    end
  end
  root to: "notes#index"
end
