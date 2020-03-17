Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :questions
      resources :surveys, except: [:update] do
        member do
          patch 'selected', to: 'surveys#update_selected'
          put 'selected', to: 'surveys#update_selected'    
        end
      end
      post '/results', to: 'results#send'
      post '/recommends', to: 'recommend#recommend'
    end
  end
end
