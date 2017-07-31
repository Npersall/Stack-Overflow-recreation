get '/users/new' do
  erb :"users/new"
end

post '/users' do
  @user= User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect "users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/:id' do
  check_permissions
  @user = User.find(params[:id])
  if current_user && logged_in?
    erb :'/users/show'
  else
    redirect '/users/new'
  end
end

