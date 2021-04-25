class ShopController < ApplicationController
  layout 'shop/shop'
  before_action :set_openhours


  def index
  end
  
  def produktliste
  end

  def warenkorb
  end

  def kasse
    
  end
  
  
  private
  
  def set_openhours
    @openhours = Openhour.all
  end
  
  
end
