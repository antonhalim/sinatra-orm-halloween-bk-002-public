class KidsController < HalloweenController
  get '/kids/new' do
    @kid = Kid.new
    erb :'kids/new'
  end

  post '/kids' do
    @kid = Kid.create(params[:kid])
    @kid.bucket = Bucket.new
    redirect "/kids/#{@kid.id}"
  end

  get '/kids/:id' do
    @kid = Kid.find_by(:id => params[:id])
    erb :'kids/show'
  end
end