Rails.application.routes.draw do
  get("/", { :controller => "sessions", :action => "new" })
  resources "entries"
  resources "places"
  resources "sessions"
  resources "users"



  get("/login", {:controller => "sessions", :action => "new"})
  get("/logout", {:controller => "sessions", :action => "destroy"})
end
