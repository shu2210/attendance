Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'working_times#index'

  get 'working/list', to: 'working_times#list', as: 'list_working_time'
  post 'working/start', to: 'working_times#start', as: 'start_working_time'
  post 'working/end', to: 'working_times#end', as: 'end_working_time'
end
