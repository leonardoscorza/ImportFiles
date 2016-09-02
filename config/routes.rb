Rails.application.routes.draw do
  root 'sales#index'
  post 'sales' => 'sales#create', as: :sales
  delete 'sales' => 'sales#destroy'
end
