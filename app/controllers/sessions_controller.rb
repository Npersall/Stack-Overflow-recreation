get '/login' do
  erb :'sessions/login'
end

post "/login" do
  user = User.find_by(username: params[:user][:username])
  if user && User.authenticate(params[:user][:username],params[:user][:password])
    session[:id] = user.id
    redirect "/users/#{user.id}"
  else
    @errors = ["Password or Username is invalid. Please try again."]
    erb :'sessions/login'
  end
end

delete '/logout' do
  session[:id] = nil
  redirect '/'
end
