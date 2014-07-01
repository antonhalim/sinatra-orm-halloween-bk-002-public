class RootController < HalloweenController
  get '/' do 
    redirect '/houses'
  end
end