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
    @errors = Array.new #holds error objects
    @line_items = Array.new #holds existing_line items in case of errors
    line_items = params[:line_items]
    #Loop through @line_items first to validate but NOT to persist. If any is invalid, then render the order edit
    #view to display @errors without saving. Otherwise save them and redirect to order show page.
    
    line_items.each do |li|
      line_item = LineItem.new(li)
      if ! li[:id].empty? #has value for id
        existing_line_item = LineItem.find(li[:id]) #line item already exists
        if line_item.quantity == 0 || line_item.quantity.nil? #quantity changed to 0
          #existing_line_item.destroy
          #order_changed = true
          @line_items << existing_line_item
        elsif existing_line_item.quantity == line_item.quantity #quantity not changed
          #do nothing if quantity not changed
          @line_items << existing_line_item
        else #quantity changed to something other than 0
          #existing_line_item.update_attributes(li)
          @errors << line_item.errors if line_item.invalid?
          @line_items << existing_line_item
          #order_changed = true
        end
      elsif line_item.quantity != 0 && line_item.id.nil? && ! line_item.quantity.nil? #line item does not already exist, so need to create a new one
        #@line_item = line_item
        line_item.order_id = params[:order_id]
        #@line_item.save
        #order_changed = true
        @errors << line_item.errors if line_item.invalid?
        @line_items << line_item
      else
        @line_items << line_item
      end
    end #each to validate
    if ! @errors.empty?
      @order = Order.find(params[:order_id])
      render "orders/edit"
    else
      line_items.each do |li|
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
        elsif line_item.quantity != 0 && line_item.id.nil? && ! line_item.quantity.nil? #line item does not already exist, so need to create a new one
          line_item = line_item
          line_item.order_id = params[:order_id]
          line_item.save
          order_changed = true
        end
      end #each to save
    
    UserMailer.send_invoice(current_user, Order.find(params[:order_id]), true).deliver if order_changed
    notice = order_changed ? 'Order was successfully updated' : 'Order was not changed'
    redirect_to Order.find(params[:order_id]), notice: notice
    end
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
