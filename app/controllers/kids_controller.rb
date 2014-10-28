class KidsController < HalloweenController

  get "/kids" do
    @kids = Kid.all
    erb :"kids/index"
  end

  get "/kids/new" do
    erb :"kids/new"
  end

  get "/kids/:id" do
    @kid = Kid.find(params[:id])
    erb :"/kids/show"
  end

  post "/kids" do
    @kid = Kid.create(params[:kid])
    @kid.bucket = Bucket.create
    redirect "/kids/#{@kid.id}"
  end

  post "/kids/:id/pig-out" do
    @kid = Kid.find(params[:id])
    num_of_candies = params[:consumption].to_i
    @kid.pig_out(num_of_candies)
    redirect :"kids/#{@kid.id}"
  end
end