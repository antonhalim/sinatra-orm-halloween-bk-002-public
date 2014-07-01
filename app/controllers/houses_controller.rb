class HousesController < HalloweenController
  get '/houses' do
    @houses = House.all
    erb :'houses/index'
  end

  get '/houses/:id' do
    @house = House.find_by(:id => params[:id])
    @unclaimed_candies = @house.candies.select{|c| c if !c.bucket_id}
    binding.pry
    @kids = Kid.all
    erb :'houses/show'
  end

  post '/houses/:id/trick-or-treat' do
    @house = House.find_by(:id => params[:id])
    @kid = Kid.find_by(:id => params[:kid_id])
    @house.give_candy(@kid)
    redirect "/houses/#{@house.id}"
  end
end