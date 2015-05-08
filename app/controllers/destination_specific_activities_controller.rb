class DestinationSpecificActivitiesController < ApplicationController
  # GET /destination_specific_activities
  # GET /destination_specific_activities.json
  def index
    @destination_specific_activities = DestinationSpecificActivity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @destination_specific_activities }
    end
  end

  # GET /destination_specific_activities/1
  # GET /destination_specific_activities/1.json
  def show
    @destination_specific_activity = DestinationSpecificActivity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @destination_specific_activity }
    end
  end

  # GET /destination_specific_activities/new
  # GET /destination_specific_activities/new.json
  def new
    @destination_specific_activity = DestinationSpecificActivity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @destination_specific_activity }
    end
  end

  # GET /destination_specific_activities/1/edit
  def edit
    @destination_specific_activity = DestinationSpecificActivity.find(params[:id])
  end

  # POST /destination_specific_activities
  # POST /destination_specific_activities.json
  def create
    @destination_specific_activity = DestinationSpecificActivity.new(params[:destination_specific_activity])

    respond_to do |format|
      if @destination_specific_activity.save
        format.html { redirect_to @destination_specific_activity, notice: 'Destination specific activity was successfully created.' }
        format.json { render json: @destination_specific_activity, status: :created, location: @destination_specific_activity }
      else
        format.html { render action: "new" }
        format.json { render json: @destination_specific_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /destination_specific_activities/1
  # PUT /destination_specific_activities/1.json
  def update
    @destination_specific_activity = DestinationSpecificActivity.find(params[:id])

    respond_to do |format|
      if @destination_specific_activity.update_attributes(params[:destination_specific_activity])
        format.html { redirect_to @destination_specific_activity, notice: 'Destination specific activity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @destination_specific_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /destination_specific_activities/1
  # DELETE /destination_specific_activities/1.json
  def destroy
    @destination_specific_activity = DestinationSpecificActivity.find(params[:id])
    @destination_specific_activity.destroy

    respond_to do |format|
      format.html { redirect_to destination_specific_activities_url }
      format.json { head :no_content }
    end
  end
end
