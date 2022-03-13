module SalesHelper
  def active_sale?
    Sale.active.any?
  end

  def active_sale_name
    Sale.active_sale_name
  end

  def active_sale_percent_off
    Sale.active_sale_percent_off
  end
end