class ApplicationController < Sinatra::Base

  # Add this line to set the Content-Type header for all responses
  set :default_content_type, 'application/json'


  get '/bakeries' do
    puts "hello"
    #get bakeries from db
    bakeries = Bakery.all 

    # return a JSON response with an array of all the bakery data
    bakeries.to_json
  end

  get '/bakeries/:id' do
    # look up the bakery in the db using its id
    bakery = Bakery.find(params[:id])

    # send a json-formatted response of the bakery data & include associated baked goods
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    # see the BakedGood class for the  method definition of `.by_price`
    baked_goods = BakedGood.by_price
    baked_goods.to_json
  end


  # get '/hotdogs/:hey/:there' do
  #   binding.pry
  # end

end
