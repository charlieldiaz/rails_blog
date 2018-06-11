Rails.application.routes.draw do


  get 'posts/new',to: 'posts#new', as: 'new'
  post 'posts/create',to: 'posts#create', as: 'create'
  get 'posts/:id',to: 'posts#show', as: 'post'
  get 'posts/:id/edit' ,to: 'posts#edit', as: 'edit'

  patch 'posts/:id',to: 'posts#update', as: 'update'
  delete 'posts/:id', to: 'posts#destroy', as: 'delete'

  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
