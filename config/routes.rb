Rails.application.routes.draw do
  root 'sales_group#index'
  post 'sales_groups' => 'sales_group#create', as: :sales
  delete 'sales_groups' => 'sales_group#destroy'
end
