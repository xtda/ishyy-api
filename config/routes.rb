Rails.application.routes.draw do
  scope module: 'api' do
    namespace :v1 do
      namespace :streamelements do
        post '/give/:from/:to/:amount', to: 'give#update'
        post '/overunder/:player/:choice/:amount', to: 'overunder#update'
        post '/tax/pay_tax/:caller/:amount', to: 'pay_tax#update'
        get '/player/:caller', to: 'player_id#show'

        namespace :mayor_system do
          get '/current', to: 'current#index'
          get '/current/name', to: 'current#show'

          post '/vote/:caller/:vote', to: 'vote#update'

          get '/funds', to: 'funds#show'
          post '/funds/:caller/:amount', to: 'funds#update'

          get '/tax', to: 'tax#show'
          post '/tax/:caller/:tax', to: 'tax#update'

          post '/transfer/:caller/:to/:amount', to: 'transfer#update'

          post '/job_bonus/:caller/:job/:amount', to: 'job_bonus#update'
        end
        namespace :job_system do
          post '/sign_on/:player/:job', to: 'sign_on#update'
          post '/sign_off/:player', to: 'sign_off#update'

          post '/work/:player', to: 'work#update'

          get '/bonus', to: 'bonus#show'
        end
      end
    end
  end
end
