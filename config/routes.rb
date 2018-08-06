Rails.application.routes.draw do
  scope module: 'api' do
    namespace :v1 do
      namespace :streamelements do
        post '/give/:from/:to/:amount', to: 'give#update'
        post '/overunder/:player/:choice/:amount', to: 'overunder#update'
        post '/tax/pay_tax/:caller/:amount', to: 'pay_tax#update'
        namespace :mayor_system do
          get '/current', to: 'current#index'
          get '/current/name', to: 'current#show'

          post '/vote/:caller/:vote', to: 'vote#update'

          get '/funds', to: 'funds#show'
          post '/funds/:caller/:amount', to: 'funds#update'

          get '/tax', to: 'tax#show'
          post '/tax/:caller/:tax', to: 'tax#update'

          post '/transfer/:caller/:to/:amount', to: 'transfer#update'

        end
      end
    end
  end
end
