class AddDiscountCentsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :sale_percent_off, :integer
  end
end
