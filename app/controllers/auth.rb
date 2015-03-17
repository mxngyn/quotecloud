after do
ActiveRecord::Base.connection.close
end

get '/' do
  @quote = Quote.all.sample
  erb :index
end

get '/login' do
  erb :'auth/login'
end

post '/login' do
  user = User.find_by(email: params[:user][:email])
  user.try(:authenticate, params[:user][:password])
  if user
    session[:user_id] = user.id
    redirect "/"
  else
    add_error!("Login failed.")
    erb :'/auth/login'
  end
end

get '/signup' do
  erb :'auth/signup'
end

post '/signup' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    erb :'home'
  else
    parse_ar_errors_for_display!(user.errors.messages)
    redirect "/signup"
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/home' do
  erb :'home'
end