class MoneyCalculator
  attr_accessor :ones
  attr_accessor :fives
  attr_accessor :tens
  attr_accessor :twenties
  attr_accessor :fifties
  attr_accessor :hundreds 
  attr_accessor :five_hundreds
  attr_accessor :thousands
  attr_accessor :change

  def initialize(ones, fives, tens, twenties, fifties, hundreds, five_hundreds, thousands)

    @totalPayment = (ones * 1) + (fives * 5) + (twenties * 20) + (fifties * 50) + (hundreds * 100) + (five_hundreds * 500) + (thousands*1000)

    @thousands = 0
    @five_hundreds = 0
    @hundreds = 0
    @fifties = 0
    @twenties = 0
    @tens = 0
    @fives = 0
    @ones = 0

  end

  def binayad
    return @totalPayment
  end

  def magkano
    return
  end 

  def bigaysukli(cost, bayad)
    return (bayad.to_i - cost.to_i)
  end


  def givechange(cost)
        
      @totalchange = @totalPayment - cost.to_i

      isanlibo = @totalchange/1000
      ninoy = (@totalchange%1000)/500
      isandaan = ((@totalchange%1000)%500)/100
      singkwenta = (((@totalchange%1000)%500)%100)/50
      bente = ((((@totalchange%1000)%500)%100)%50)/20
      dyis = (((((@totalchange%1000)%500)%100)%50)%20)/10
      singko = ((((((@totalchange%1000)%500)%100)%50)%20)%10)/5
      piso = ((((((@totalchange%1000)%500)%100)%50)%20)%10)%5

      @change = {
        :ones => piso, 
        :fives => singko, 
        :tens => dyis, 
        :twenties => bente, 
        :fifties => singkwenta, 
        :hundreds => isandaan, 
        :five_hundreds => ninoy, 
        :thousands => isanlibo, }
      
      
      return @change
  end

  
end

