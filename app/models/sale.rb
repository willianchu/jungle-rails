class Sale < ActiveRecord::Base

    #AR Scope
  def self.active 
    where("starts_on <= ? AND ends_on >= ?", Date.current, Date.current) 
  end
  
  def self.active_sale_name
    where("starts_on <= ? AND ends_on >= ?", Date.current, Date.current).first.name
  end

  def self.active_sale_discount
    where("starts_on <= ? AND ends_on >= ?", Date.current, Date.current).first.percent_off
  end
  
  def finished?
  ends_on < Date.current
  end

  def upcoming?
    starts_on > Date.current
  end

  def current?
    !finished? && !upcoming?
  end
end
