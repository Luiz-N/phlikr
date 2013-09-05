get '/' do
  # Look in app/views/index.erb
  @photos = Photo.all



  erb :index
end


get '/new_album' do
  if current_user
    erb :new_album
  else
    erb :login
  end
end

get '/login' do

  erb :login
end

get '/new_user' do

  erb :new_user
end




##############POST##########################

post '/user/login' do

  if User.find_by_email(params[:email])
    @login = User.find_by_email(params[:email])
    if @login.password == params[:password]
      session[:user_id] = @login.id
      redirect "/"
    else
      @error = "Incorrect email and/or password"
      erb :login #email or pw incorrect
      # redirect "/user/login"
    end
  else
    @error = "Incorrect email and/or password"
    erb :login #error no user message
  end

end

post '/user/new' do
  @user = User.find_by_email(params[:user][:email])
  
  # If they don't exist, create new user
  if @user.nil? 
    @user = User.create(params[:user])
    session[:user_id] = @user.id

  end

  redirect "/"
end
