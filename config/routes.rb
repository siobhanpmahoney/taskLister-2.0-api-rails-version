Rails.application.routes.draw do
  resources :task_users
  resources :task_tags
  resources :task_pages
  namespace :api do
    namespace :v1 do
      resources :users
      resources :pages
      resources :tags
      resources :tasks


      get '/tasks/:id/pages/:page_id', to: 'tasks#task_page'
      delete '/tasks/:id/pages/:page_id', to: 'tasks#destroy_task_page'

      get '/tasks/:id/tags/:tag_id', to: 'tasks#task_tag'
      delete '/tasks/:id/tags/:tag_id', to: 'tasks#destroy_task_tag'

      get '/tasks/:id/users/:user_id', to: 'tasks#task_user'
      delete '/tasks/:id/users/:user_id', to: 'tasks#destroy_task_user'



      post '/login', to: 'auth#login'
      get '/current_user', to: 'auth#currentUser'
      post '/signup', to: 'auth#signup'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
