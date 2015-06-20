class RaidsController < ApplicationController
  # load_and_authorize_resource
  add_breadcrumb 'डॅशबोर्ड', :root_path
  add_breadcrumb 'छाप्याचे वेळापत्रक', :edit_raid_path
  before_action :set_raid, only: [:show, :edit, :update, :destroy]

  # GET /raids
  # GET /raids.json
  def index
    @raids = Raid.all
  end

  # GET /raids/1
  # GET /raids/1.json
  def show
  end

  # GET /raids/new
  def new
    @raid = Raid.new
  end

  # GET /raids/1/edit
  def edit
  end

  # POST /raids
  # POST /raids.json
  def create
    @raid = Raid.new(raid_params)

    respond_to do |format|
      if @raid.save
        format.html { redirect_to @raid, notice: 'Raid was successfully created.' }
        format.json { render :show, status: :created, location: @raid }
      else
        format.html { render :new }
        format.json { render json: @raid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /raids/1
  # PATCH/PUT /raids/1.json
  def update
    respond_to do |format|
      if @raid.update(raid_params)
        format.html { redirect_to community_farm_raid_community_farms_path(@raid), notice: RAID_SCHEDULE }
        format.json { render :show, status: :ok, location: @raid }
      else
        format.html { render :edit }
        format.json { render json: @raid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raids/1
  # DELETE /raids/1.json
  def destroy
    @raid.destroy
    respond_to do |format|
      format.html { redirect_to raids_url, notice: 'Raid was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raid
      @raid = Raid.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def raid_params
      params.require(:raid).permit(:title, :datetime, :location_id, :raid_for, :description)
    end
end
