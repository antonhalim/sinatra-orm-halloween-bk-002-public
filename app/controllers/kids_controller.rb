class KidsController < HalloweenController
  get '/kids/new' do
    @kid = Kid.new
    @kid.bucket = Bucket.new
    erb :'kids/new'
  end

  post '/kids' do
    @kid = Kid.create(params[:kid])
    redirect "/kids/#{@kid.id}"
  end

  get '/kids/:id' do
    @kid = Kid.find_by(:id => params[:id])
    erb :'kids/show'
  end
end