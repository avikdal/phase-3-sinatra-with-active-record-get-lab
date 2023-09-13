class BakedGood < ActiveRecord::Base
  belongs_to :bakery

  def self.by_price
    self.all.order(price: :desc)
    puts "Inside the by_price method"
    
  end
end

BakedGood.by_price
