require 'sinatra'
require './boot.rb'
require './money_calculator.rb'

get '/admin' do
  @products = Item.all
  erb :admin_index
end

get '/new_product' do
  @product = Item.new
  erb :product_form
end

get '/' do
  @products = Item.all 
  @rand_products = @products.sample(10)
  erb :index
end

get '/index' do
  @products = Item.all 
  @rand_products = @products.sample(10)

  erb :index
end

get '/products' do
  @products = Item.all
  erb :productlist
end

get '/about' do
  erb :about
end

get '/ss' do
  erb :ss
end

get '/buy/:id' do
  @product = Item.find(params[:id])
  erb :buy
end

get '/error' do
  erb :error
end

post '/checkout/:id' do
  @product = Item.find(params[:id])
  
  @qtyBuy = params[:qty].to_i
  @realCost = @qtyBuy.to_i*@product.price.to_i
  @amtPaid = MoneyCalculator.new(params[:piso].to_i, params[:singko].to_i, params[:dyis].to_i, params[:bente].to_i, params[:singkwenta].to_i, params[:isandaan].to_i, params[:ninoy].to_i, params[:isanlibo].to_i)
  @ibinayad = @amtPaid.binayad  

  if @qtyBuy > @product.quantity
    erb :errorq
  elsif @ibinayad < @realCost
    erb :errorp
  else

    finalqty = @product.quantity - @qtyBuy
    finalsold = @product.sold + @qtyBuy
    
    @product.update_attributes!(
    quantity: finalqty,
    sold: finalsold,
  )
    @isinukli = @ibinayad - @realCost    

    @change = @amtPaid.givechange(@realCost)
    #@sukli = @amtPaid.bigaysukli(@realcost) 
    erb :checkout
  end

  
end

#shit purpose

get '/check' do
  erb :check
end

# ROUTES FOR ADMIN SECTION

post '/create_product' do
  Item.create!(
    name: params[:name],
    price: params[:price],
    quantity: params[:quantity],
    sold: 0
  )
  redirect to '/admin'
end

get '/edit_product/:id' do
  @product = Item.find(params[:id])
  erb :product_form
end

post '/update_product/:id' do
  @product = Item.find(params[:id])
  @product.update_attributes!(
    name: params[:name],
    price: params[:price],
    quantity: params[:quantity],
  )
  redirect to '/admin'
end

get '/delete_product/:id' do
  @product = Item.find(params[:id])
  @product.destroy!
  redirect to '/admin'
end
