class HousesController < HalloweenController
  get '/houses' do
    @houses = House.all
    erb :'houses/index'
  end

  get '/houses/:id' do
    @house = House.find_by(:id => params[:id])
    erb :'houses/show'
  end
end