class HousesController < HalloweenController

		get '/houses' do
			erb :'houses/index'
		end

		get '/houses/new' do
			erb :'houses/new'
		end

		post '/houses' do
			@house = House.create(params["house"])
			redirect "/houses/#{@house.id}"
		end

		get '/houses/:id' do
			@house = House.find(params[:id])
			erb :'houses/show'
		end

		patch '/houses/:id/trick-or-treat' do
			@kid = Kid.find(params["kid_id"])
			@house = House.find(params["id"])
			@house.give_candy(@kid)
			redirect :"/houses/#{@house.id}"
		end

		patch '/houses/:id' do
			@house = House.find(params[:id])
			@house.update(params["house"])
			redirect "/houses/#{@house.id}"
		end


end
