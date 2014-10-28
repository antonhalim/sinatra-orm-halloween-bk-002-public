class KidsController < HalloweenController

  get "/kids" do
    @kids = Kid.all
    erb :'kids/index'
  end

  post "/kids" do
    @kid = Kid.create(params[:kid])
    redirect "kids/#{@kid.id}"
  end

  get "/kids/new" do
    erb :'kids/new'
  end

  post "/kids/:id/pig-out" do
    @kid = Kid.find(params[:id])
    @kid.pig_out(params["consumption"].to_i)
    redirect "kids/#{@kid.id}"
  end

  get "/kids/:id" do
    @kid = Kid.find(params[:id])
    erb :'kids/show'
  end


end