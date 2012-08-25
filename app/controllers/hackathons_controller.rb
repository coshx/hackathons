class HackathonsController < ApplicationController
  before_filter :check_authorized, :except => [:index, :show, :new, :create]

  # GET /hackathons
  # GET /hackathons.json
  def index
    @hackathons = Hackathon.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hackathons }
    end
  end

  # GET /hackathons/1
  # GET /hackathons/1.json
  def show
    @hackathon = Hackathon.find(params[:id])
    @projects = @hackathon.projects.sort_by(&:name)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hackathon }
    end
  end

  # GET /hackathons/new
  # GET /hackathons/new.json
  def new
    @hackathon = Hackathon.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hackathon }
    end
  end

  # GET /hackathons/1/edit
  def edit
    @hackathon = Hackathon.find(params[:id])
  end

  # POST /hackathons
  # POST /hackathons.json
  def create
    @hackathon = Hackathon.new(params[:hackathon])
    @hackathon.admins << current_user
    @hackathon.save!

    respond_to do |format|
      if @hackathon.save
        format.html { redirect_to @hackathon, notice: 'Hackathon was successfully created.' }
        format.json { render json: @hackathon, status: :created, location: @hackathon }
      else
        format.html { render action: "new" }
        format.json { render json: @hackathon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hackathons/1
  # PUT /hackathons/1.json
  def update
    @hackathon = Hackathon.find(params[:id])

    respond_to do |format|
      if @hackathon.update_attributes(params[:hackathon])
        format.html { redirect_to @hackathon, notice: 'Hackathon was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hackathon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hackathons/1
  # DELETE /hackathons/1.json
  def destroy
    @hackathon = Hackathon.find(params[:id])
    @hackathon.delete

    respond_to do |format|
      format.html { redirect_to hackathons_url }
      format.json { head :no_content }
    end
  end

  private
  def check_authorized
    hackathon = Hackathon.find(params[:id])
    unless hackathon.is_admin?(current_user)
      redirect_to hackathon, :alert => 'Sorry, but you don\'t have permission to do that.'
    end
  end
end
