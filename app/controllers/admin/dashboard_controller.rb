class Admin::DashboardController < ApplicationController

  before_filter :authorize_adm

  def show
    @total_products = Product.count
    @total_categories = Category.count
  end
end
