Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }

  get "/about" => "about#show"
  get "/search" => 'about#search'
  get '/prelim' => 'about#prelim'
  get '/dummyjson' => 'about#dummyjson'
  get "/get_links" => "about#return_links"
  get "/no_entries" => "about#no_entries"
  get "/match_frame" => "about#match_frame"
  post "/vote_reg" => "about#vote_reg"
  post "/tournaments/:tournament_id/set_next_round" => "rounds#set_new_round"

  root to: "about#index"

  get "/find_pets" => "find_pets#show"

  get "/get_links" => "about#return_links"

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :pets

  resources :user_profiles do
    resources :media_links
  end

  resources :tournaments do
    resources :rounds do
      resources :matches do
        resources :entries
      end
    end
  end
end
