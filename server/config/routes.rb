Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :accounts
      resource :senders
      resource :reveivers
      resource :messages
    end
  end
end
