class LineItemsController < ApplicationController
  # GET /line_items
  # GET /line_items.json
  load_and_authorize_resource #cancancan
  def index
    @line_items = LineItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @line_items }
    end
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @line_item }
    end
  end

  # GET /line_items/new
  # GET /line_items/new.json
  def new
    @line_item = LineItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @line_item }
    end
  end

  # GET /line_items/1/edit
  def edit
    @line_item = LineItem.find(params[:id])
  end

  # POST /line_items
  # POST /line_items.json
  def create
    @line_item = LineItem.new(params[:line_item])

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item, notice: 'Line item was successfully created.' }
        format.json { render json: @line_item, status: :created, location: @line_item }
      else
        format.html { render action: "new" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /line_items/1
  # PUT /line_items/1.json
  def update
    order_changed = false
    @line_items = params[:line_items]
    @line_items.each do |li|
      line_item = LineItem.new(li)
      if ! li[:id].empty? #has value for id
        existing_line_item = LineItem.find(li[:id]) #line item already exists
        if line_item.quantity == 0 || line_item.quantity.nil? #quantity changed to 0
          existing_line_item.destroy
          order_changed = true
        elsif existing_line_item.quantity == line_item.quantity #quantity not changed
          #do nothing if quantity not changed
        else #quantity changed to something other than 0
          existing_line_item.update_attributes(li)
          order_changed = true
        end
      elsif line_item.id.nil? && ! line_item.quantity.nil? #line item does not already exist, so need to create a new one
        @line_item = line_item
        @line_item.order_id = params[:order_id]
        @line_item.save
        order_changed = true
      end
    end #each
    UserMailer.send_invoice(current_user, Order.find(params[:order_id]), true).deliver if order_changed
    redirect_to Order.find(params[:order_id]), notice: 'Order was succesfully updated.'
 
  end #update

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to line_items_url }
      format.json { head :no_content }
    end
  end
end
