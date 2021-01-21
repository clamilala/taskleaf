#ルーティング
Rails.application.routes.draw do

  namespace :admin do
    # namespace :admin の中に定義すると、URLに /admin 、ヘルパーメソッドに admin_ がつくようになる
    resources :users
  end

  root to: 'tasks#index'
  resources :tasks
  #resources :tasks で以下のルートが生成されている
  # GET  /tasks(.:format)	=> tasks#index
  # POST /tasks(.:format)	=> tasks#create
  #	GET  /tasks/new(.:format)	=> tasks#new
  #	GET  /tasks/:id/edit(.:format) => tasks#edit
  #	GET  /tasks/:id(.:format)	=> tasks#show
  # PATCH /tasks/:id(.:format) => tasks#update
  # PUT  /tasks/:id(.:format)	=> tasks#update
  # DELETE /tasks/:id(.:format)	=> tasks#destroy
  # GET / => tasks#index

end
