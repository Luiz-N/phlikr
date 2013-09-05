get '/' do
  # Look in app/views/index.erb
  @photos = Photo.all



  erb :index
end


get '/new_album' do
  


end
