def current_user
  @user ||= User.find (session[:id]) if session[:id]
end

def logged_in?
  !!current_user
end

def check_permissions
  redirect '/users/new' unless logged_in?
end
