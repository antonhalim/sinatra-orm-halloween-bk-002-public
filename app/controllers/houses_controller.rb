class HousesController < HalloweenController

  get '/houses' do
    @houses = House.all
    erb :'houses/index'
  end

  get "/houses/new" do
    erb :"houses/new"
  end
  
  get "/houses/:id" do
    @house = House.find(params[:id])
    erb :'houses/show'
  end

  post "/houses" do
    @house = House.create(params[:house])
    redirect "/houses/#{@house.id}"
  end

  patch "/houses/:id" do 
    @house = House.find(params[:id])
    if @house.update(params[:house])
      redirect "/houses/#{@house.id}"
    else
      redirect "/houses/#{@house.id}/edit"
    end
  end

  patch "/houses/:id/trick-or-treat" do
    @house = House.find(params[:id])
    @kid = Kid.find(params[:kid_id])
    @house.give_candy(@kid)
    redirect "/houses/#{@house.id}"
  end

  get "/houses/:id/edit" do
    @house = House.find(params[:id])
    erb :'houses/edit'
  end

end