class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
      @order_guides = current_order.order_guides
    end

end
