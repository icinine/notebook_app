Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :notes
  
  #If a user is signed in, root them to the notes page.
  #Cannot use 'root' alone as it gives Argument error. Auth root needs an alias
  authenticated :user do
    root 'notes#index', as: "authenticated_root"
  end
  #Else if not signed in send to normal root
  root 'welcome#index'
  
end
