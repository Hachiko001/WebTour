class OrderGuidesController < ApplicationController
  def create
    @order = current_order
    @order_guide = @order.order_guides.new(order_guide_params)
    @order.save
    session[:order_id] = @order.id
  end

  def update
  @order = current_order
   @order_guide = @order.order_guides.find(params[:id])
   @order_guide.update_attributes(order_guide_params)
   @order_guides = @order.order_guides
  end

  def destroy
  @order = current_order
   @order_guide = @order.order_guides.find(params[:id])
   @order_guide.destroy
   @order_guides = @order.order_guides
  end

  private
  def order_guide_params
    params.require(:order_guide).permit(:quantity, :guide_id)
  end
end
