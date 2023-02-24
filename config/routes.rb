Rails.application.routes.draw do
  get 'bookmarks/comment'
    root to: 'lists#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :lists, only: [:show, :new, :create] do
    resources :bookmarks, only: [:new, :create, :destroy, :show]
  end


end

# Prefix Verb   URI Pattern                                                                                       Controller#Action
# bookmarks_comment GET    /bookmarks/comment(.:format)                                                                      bookmarks#comment
#    list_bookmarks POST   /lists/:list_id/bookmarks(.:format)                                                               bookmarks#create
# new_list_bookmark GET    /lists/:list_id/bookmarks/new(.:format)                                                           bookmarks#new
#     list_bookmark DELETE /lists/:list_id/bookmarks/:id(.:format)                                                           bookmarks#destroy
#             lists GET    /lists(.:format)                                                                                  lists#index
#                   POST   /lists(.:format)                                                                                  lists#create
#          new_list GET    /lists/new(.:format)                                                                              lists#new
#              list GET    /lists/:id(.:format)                                                                              lists#show
