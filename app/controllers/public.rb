get "/user/:id" do |id|
  @user = User.find(id)
  erb :'/pub/profile'
end