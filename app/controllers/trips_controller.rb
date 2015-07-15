class TripsController < ApplicationController
  # GET /trips
  # GET /trips.json
  skip_before_filter :authenticate_user!, :only => [:public_show]
  load_and_authorize_resource #cancancan
  skip_authorization_check :only => [:public_show]
  def index
    @trips = Trip.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trips }
    end
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    @trip = Trip.find(params[:id])

    respond_to do |format|
      format.html #{render layout: 'trip'}# show.html.erb
      format.json { render json: @trip }
    end
  end
  
  def public_show
    @trip = Trip.find(params[:id])

    respond_to do |format|
      format.html #{render layout: 'trip'}# show.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /trips/new
  # GET /trips/new.json
  def new
    @trip = Trip.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /trips/1/edit
  def edit
    @trip = Trip.find(params[:id])
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(params[:trip])

    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render json: @trip, status: :created, location: @trip }
      else
        format.html { render action: "new" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trips/1
  # PUT /trips/1.json
  def update
    @trip = Trip.find(params[:id])

    respond_to do |format|
      if @trip.update_attributes(params[:trip])
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to trips_url }
      format.json { head :no_content }
    end
  end
  
  def email_publicize_new
    @trip = Trip.find(params[:id])
  end
  
  def email_publicize_create
    @trip = Trip.find(params[:id])
    @addresses = params[:addresses].split(",").map(&:strip)
    UserMailer.send_publicize_trip(@addresses, @trip, params[:message])
    redirect_to trip_url(@trip)
  end
end
