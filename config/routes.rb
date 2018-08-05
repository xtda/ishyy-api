Rails.application.routes.draw do
  scope module: 'api' do
    namespace :v1 do
      namespace :streamelements do
        post '/give/:from/:to/:amount', to: 'give#update'
        post '/overunder/:player/:choice/:amount', to: 'overunder#update'
      end
    end
  end
end
