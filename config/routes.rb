Rails.application.routes.draw do
  post "/users" => "users#create"
  get "/users/:id" => "users#show"
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"

  post "/sessions" => "sessions#create"

  get "/prompts" => "prompts#index"

  get "/examples" => "examples#index"
  get "/examples/:id" => "examples#show"
  post "/examples" => "examples#create"
  patch "/examples/:id" => "examples#update"
  delete "/examples/:id" => "examples#destroy"

  get "/words/:id" => "words#show"

end
