class Admin::SalesController < ApplicationController

  before_filter :authorize_adm

  def index
    @sales = Sale.all
  end

end
