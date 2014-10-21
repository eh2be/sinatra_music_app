#enable  :sessions
# Homepage (Root path)
get '/' do
  erb :index
end

get '/signin' do
  erb :signin
end

# takes username and password from the signin form and check against the User table to find that unique combination. If its found (i.e. != [] which means not and empty array) then it takes us to the tracks page otherwise it takes us back to the login page again.
post '/signin' do
  username = params[:username]
  pw = params[:password]
  user = User.where(username: username, password: pw)

  if user != []
    session[:username] = username

    redirect '/tracks'
  else
    redirect '/signin'
  end
end

# This ends the session when the user clicks the logout button.
post '/signout' do
  session.clear
  redirect '/'
end

get '/tracks' do
  @tracks = Track.all
  @tracks = Track.order(upvotes: :desc)
  erb :'tracks/index'
end

get '/tracks/new' do
  erb :'tracks/new'
end

post '/tracks' do
  @track = Track.new(
    songtitle: params[:songtitle],
    author: params[:author],
    url:  params[:url]
  )
  if @track.save
    redirect '/tracks'
  else
    erb :'tracks/new'
  end
end

get '/tracks/:id' do
  @track = Track.find params[:id]
  erb :'tracks/show'
end

post '/tracks/:track_id/upvotes' do
  track = Track.find params[:track_id]
  user = User.find params[:track_id]
  upvote_exist = Upvote.find_by track_id: track.id, user_id: user.id
  # binding.pry

  if upvote_exist == nil
    Upvote.create track_id: track.id, user_id: user.id
  end
  # binding.pry
  redirect '/tracks'
end

# get '/tracks/:track_id/upvotes' do
#   erb :'tracks/upvotes'
# end