module Admin
  class OrdersController < ApplicationController
    before_action :set_order, only: [:show, :update, :destroy]

    def index
      @orders = Order.all

      respond_to do |format|
        format.html
        format.csv { send_data @orders.to_csv }
        format.xls { send_data @orders.to_csv(col_sep: "\t") }
      end
    end

    def show
    end

    def update
      respond_to do |format|
        if @order.update(order_params)
          format.html { redirect_to admin_orders_path, notice: 'Order was successfully updated.' }
          format.json { render :show, status: :ok, location: @order }
        else
          format.html { render :edit }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /orders/1
    # DELETE /orders/1.json
    def destroy
      @order.destroy
      respond_to do |format|
        format.html { redirect_to admin_order_url, notice: 'Order was successfully destroyed.' }
        format.json { head :no_content }
      end
    end


    private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :address, :email, :pay_type)
    end

  end
end