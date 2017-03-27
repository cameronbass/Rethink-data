Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  resources :articles do
    get 'download', on: :member
  end

  mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'
end
