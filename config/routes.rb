GithubScore::Application.routes.draw do
  root :to => "authors#index"
  resources :authors
end
