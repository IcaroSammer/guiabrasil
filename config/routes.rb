Rails.application.routes.draw do
  
#  mount Ckeditor::Engine => '/ckeditor'
  mount LoldesignPublisher::Rails::Engine => '/'
  
  devise_for :admin, path_names: {
                                   sign_in: 'entrar',
                                   sign_out: 'sair'
                                 }

  devise_for :user, path_names: {
                                       sign_in: 'entrar',
                                       sign_out: 'sair',
                                       edit: 'editar'
                                     }

  devise_for :customer, path_names: {
                                       sign_in: 'entrar',
                                       sign_out: 'sair',
                                       edit: 'editar'
                                     }
  
                                        
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :cities, only: [:index] 


  namespace :admin do 

    resources :customers do
      collection do
        get :filters
      end
    end

    resources :booking_policies do
      collection do
        get :filters
      end
    end

    resources :rooms do
      collection do
        get :filters
      end
    end

    resources :occupations do
      collection do
        get :filters
      end
    end

    resources :accommodation_sizes do
      collection do
        get :filters
      end
    end

    resources :type_terms do
      collection do
        get :filters
      end
    end

    resources :terms do
      collection do
        get :filters
      end
    end

    resources :establishment_terms do
      collection do
        get :filters
      end
    end

    resources :type_attractions do
      collection do
        get :filters
      end
    end

    resources :users do
      collection do
        get :filters
      end
    end
    
    resources :admins do
      collection do
        get :filters
      end
    end

    resources :commforts do
      collection do
        get :filters
      end
    end

    resources :price_ranges do
      collection do
        get :filters
      end
    end

    resources :payment_types do
      collection do
        get :filters
      end
    end
    resources :lodgings do
      collection do
        get :filters
      end
    end
    resources :services do
      collection do
        get :filters
      end
    end
    resources :accommodation_items do
      collection do
        get :filters
      end
    end
    resources :accommodation_types do
      collection do
        get :filters
      end
    end
    resources :environments do
      collection do
        get :filters
      end
    end
    resources :recreation_areas do
      collection do
        get :filters
      end
    end
    resources :rules do
      collection do
        get :filters
      end
    end
    resources :social_items do
      collection do
        get :filters
      end
    end

    resources :enterprises do
      collection do
        get :filters
      end
    end

    resources :structures do
      collection do
        get :filters
      end
    end


    resources :environments do
      collection do
        get :filters
      end
    end    

    resources :form_payments do
      collection do
        get :filters
      end
    end

    resources :recreation_areas do
      collection do
        get :filters
      end
    end

    resources :rules do
      collection do
        get :filters
      end
    end

    resources :services do
      collection do
        get :filters
      end
    end

    resources :social_items do
      collection do
        get :filters
      end
    end   

    resources :structures do
      collection do
        get :filters
      end
    end

    resources :users do
      collection do
        get :filters
      end
    end
    resources :icons do
      collection do
        get :filters
      end
    end

    resources :furnitures do
      collection do
        get :furnitures
      end
    end

    resources :business_establishments do
      collection do
        get :filters
      end
    end

    resources :establishment_categories do
      collection do
        get :filters
      end
    
    end


    root :to => "services#index"

  end


  namespace :user do

    resources :chefs do
      collection do
        get :filters
      end
    end

    

    resources :restaurants do
      collection do
        get :filters
        get 'country'
      end
    end
    resources :restaurant_surveys do
      collection do
        get :filters
      end
    end

    
    resources :publications do
      collection do
        get :filters
      end
    end
    resources :establishments do
      collection do
        get :filters
        get 'city'
        get 'country'
        post 'address-infos'    , to: 'establishments#address_infos', as: :address_infos

      end
    end
    
    resources :main_courses do
      collection do
        get :filters
      end
    end    

    resources :users do
      collection do
        get :filters
      end
    end 
    resources :specialities do
      collection do
        get :filters
      end
    end   
    resources :tourist_attractions do
      collection do
        get :filters
        get 'country'
      end
    end   

    resources :tourist_attraction_surveys do
      collection do
        get :filters
      end
    end      

    resources :hotels do
      collection do
        get :filters
        get 'city'
        get 'country'
      end
    end       

    resources :hotel_surveys do
      collection do
        get :filters
      end
    end  

    resources :cities do 
      collection do
        get :filters
      end
    end


    root :to => "hotels#index"


  end

  namespace :customer do 
    resources :profiles, except: [:index, :new]
  end
end
