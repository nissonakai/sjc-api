Rails.application.routes.draw do
  get 'api/private' => 'private#private'
  get 'api/private-scoped' => 'private#private_scoped'
  namespace 'api' do
    namespace 'v1' do
      resources :questions
      resources :surveys, except: [:update] do
        member do
          patch 'selected', to: 'surveys#update_selected'
          put 'selected', to: 'surveys#update_selected'    
        end
      end
      resources :jobnumbers, only: [:index, :update]
      post '/results', to: 'results#send_mail'
    end
  end
end
