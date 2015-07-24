class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  load_and_authorize_resource #cancancan
  def index
    @orders = Order.joins(:user).where( user_id: current_user)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @trip = Trip.find(params[:id])
    if ! @trip.user_registered?(current_user)
      @items = Item.find_all_by_destination_specific_activity_id(@trip.destination_specific_activity.id)
      @order = Order.new
      @order.line_items.build
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @order }
      end
    else
      @order = Order.find_by_user_id_and_trip_id(current_user.id, @trip.id)
      redirect_to action: :edit, :id => @order.id  #need to update params here to reflect the order ID or address in edit action
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
    items = Item.find_all_by_destination_specific_activity_id(@order.trip.destination_specific_activity.id)
    #@order.line_items.build
    @line_items = Array.new
    items.each_index do |i|
      if j = @order.line_items.index(items[i])
        @line_items.push(@order.line_items[j])
      else
        @line_items.push(LineItem.new({item_id: items[i].id}))
      end
    end
    @line_items.sort!{|a,b| a.item_id <=> b.item_id}
    
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])
    #Avoids saving line items that don't specify a quantity. A cleaner way to implement this probably exists.
    @order.line_items.delete_if {|line_item| line_item.quantity.blank? || line_item.quantity == 0 }

    respond_to do |format|
      if @order.save
        UserMailer.send_invoice(current_user, @order, false).deliver
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update_multiple
    params[:orders].each do |order_id, paid_hash|
      order = Order.find(order_id)
      order.update_attributes(paid_hash)
      end
    redirect_to url_for(controller: :trips, action: :show, id: params[:trip_id])
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end
