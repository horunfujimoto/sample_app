Rails.application.routes.draw do
  get 'top' => 'homes#top'
  resources :lists
  #下記が省略前のルーティング
  #get 'lists/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get '/top' => 'homes#top' #/topにアクセスした際に、homesコントローラのtopアクションが実行
  #post 'lists' => 'lists#create' #追記
  #get 'lists' => 'lists#index' #追記
  #get 'lists/:id' => 'lists#show', as: 'list'  # .../lists/1 や .../lists/3 に該当する,:idは、アクション内にparams[:id]と記述することで取得
  #as: 'list'=「'lists#show'の設定を、listとして利用できる」の意味
  #get 'lists/:id/edit' => 'lists#edit', as: 'edit_list'
  #patch 'lists/:id' => 'lists#update', as: 'update_list'
  #delete 'lists/:id' => 'lists#destroy', as: 'destroy_list'
end
