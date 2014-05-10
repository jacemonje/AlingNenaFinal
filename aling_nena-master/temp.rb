  @qtyBuy = params[:qty].to_i
  @realCost = @qtyBuy*product.price.to_i
  @amtPaid = MoneyCalculator.new(params[:piso].to_i, params[:singko].to_i, params[:dyis].to_i, params[:bente].to_i, params[:singkwenta].to_i, params[:isandaan].to_i, params[:ninoy].to_i, params[:isanlibo].to_i)

  if @qtyBuy > product.quantity
    erb :error
  elsif @amtPaid < realCost
    erb :error
  else
    finalqty = @product.quantity - @to_buy
    finalsold = @product.sold + @to_buy
    @product.update_attributes!(      
      quantity: finalqty,
      sold: finalsold,
    )
    @hashchange = @amtPaid.givechange(@realCost)
    @sukli = @amtPaid.bigaysukli(@realcost) 
  end

    self.ones = ones.to_i
    self.fives = fives.to_i
    self.tens = tens.to_i
    self.twenties = twenties.to_i
    self.fifties = fifties.to_i
    self.hundreds = hundreds.to_i
    self.five_hundreds = five_hundreds.to_i
    self.thousands = thousands.to_i


      elsif @amtPaid.to_i < @realCost.to_i
    erb :error



    if cost.to_i == @totalPayment.to_i
      return "Exact payment! No change."
    elsif cost.to_i > @totalPayment
      return "Not enoelseugh payment."
    else   


            <%= @change[:isanlibo] %>
      <%= @change[:ninoy] %>
      <%= @change[:isandaan] %>
      <%= @change[:singkwenta] %>
      <%= @change[:bente] %>
      <%= @change[:dyis] %>
      <%= @change[:singko] %>
      <%= @change[:piso] %>



      <%= @change[:ones] %>
      <%= @change[:fives] %>
      <%= @change[:tens] %>
      <%= @change[:twenties] %>
      <%= @change[:fifties] %>
      <%= @change[:hundreds] %>
      <%= @change[:five_hundreds] %>
      <%= @change[:thousands] %>


          @product.update_attributes!(
    quantity: params[:quantity] - @qtyBuy.to_i,
    sold: params[:sold] + @qtyBuy.to_i,
    )