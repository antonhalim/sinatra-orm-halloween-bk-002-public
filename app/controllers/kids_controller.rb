class KidsController < HalloweenController

		get '/kids' do
			erb :'kids/index'
		end

		get '/kids/new' do
			erb :'/kids/new'
		end

		post '/kids' do
			@kid = Kid.create(params["kid"])
			redirect "/kids/#{@kid.id}"
		end

		get '/kids/:id' do
			@kid = Kid.find(params[:id])
			erb :'kids/show'
		end

		patch '/kids/:id/pig-out' do
			@kid = Kid.find(params["id"])
			@kid.pig_out(params["consumption"].to_i)
			redirect :"/kids/#{@kid.id}"
		end
end
