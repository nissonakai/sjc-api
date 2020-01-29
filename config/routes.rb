Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :questions
      resources :surveys do
        member do
          patch 'selected', to: 'surveys#update_selected'
          put 'selected', to: 'surveys#update_selected'    
        end
      end
    end
  end
end
