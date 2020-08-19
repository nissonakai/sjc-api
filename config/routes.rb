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
      resources :jobnumbers, only: [:index, :update]
      post '/results', to: 'results#send_mail'
    end
    namespace 'v2' do
      resources :questions, only: [:index]
      resources :values_questions do
        collection do
          get 'current'
        end
      end
      resources :personality_questions do
        collection do
          get 'current'
        end
      end
      resources :surveys, except: [:update] do
        member do
          patch 'selected', to: 'surveys#update_selected'
          put 'selected', to: 'surveys#update_selected'    
        end
      end
    end
  end
end
