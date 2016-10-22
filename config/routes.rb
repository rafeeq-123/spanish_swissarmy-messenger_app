Rails.application.routes.draw do
  resource :messages do
      post "reply_phrase"
      post "send_phrase"
    end
end