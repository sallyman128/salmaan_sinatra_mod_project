class SessionsController < ApplicationController

  get "/login" do
    erb :"/sessions/login"
  end

  post "/sessions" do
    user = User.find_by(:email => params[:email])
    if user && user.authenticate(params[:password])
      session[:email] = user.email
      
    else
      redirect "/login"
    end
  end

  get "/logout" do
    erb :"/sessions/logout"
  end
end