get '/likes' do
  @likes = current_user.liked_quotes
  erb :'/user/likes'
end

post '/likes' do
  current_user.liked_quotes.where(quote_id: params[:like][:quote_id]).first_or_create {|liked_quote|}
  if request.xhr?
    "This quote has been added to your likes."
  else
    redirect "/likes"
  end
end

get "/submitted" do
  @submitted = current_user.submitted_quotes
  erb :'/user/submits'
end

get "/submitted/delete/:id" do |id|
  @quote = Quote.find(id)
  erb :'/user/delete_sub'
end

delete "/submitted/delete/:id" do |id|
  Quote.find(id).destroy
  likes = Like.where(quote_id: id)
  likes.each {|like| like.destroy}
  redirect "/submitted"
end

delete "/likes/delete/:id" do |id|
  Like.find(id).destroy
  if request.xhr?
    "Quote Removed <br>"
  else
    redirect "/likes"
  end
end

get "/edit" do
  @user = User.find(session[:user_id])
  erb :'/user/edit'
end

put "/edit" do
  current_user.update(params[:user])
  if request.xhr?
    erb :'/user/edit', layout: false
    "Update successful"
  else
    redirect "/edit"
  end
end