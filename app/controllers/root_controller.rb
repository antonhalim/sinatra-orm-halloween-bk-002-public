class RootController < HalloweenController
  get '/' do 
    erb :'root/index'
  end
end