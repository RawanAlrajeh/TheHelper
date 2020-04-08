Rails.application.routes.draw do

  resources :posts do  
    resources :comments
  end

  devise_for :users , controllers: { registrations: 'users/registrations' }
  root to: "posts#index"

  get 'mailbox/inbox' , to:'mailbox#inbox'
  get 'mailbox/sent' , to: 'mailbox#sent'
  get 'mailbox/trash' , to: 'mailbox#trash' 

  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
