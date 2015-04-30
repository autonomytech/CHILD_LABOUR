class CommunityFarmsController < ApplicationController
  load_and_authorize_resource
  before_action :set_community_farm, only: [:show, :edit, :update, :destroy]

  # GET /community_farms
  # GET /community_farms.json
  def index
    @community_farms = CommunityFarm.all
  end

  # GET /community_farms/1
  # GET /community_farms/1.json
  def show
  end

  # GET /community_farms/new
  def new
    @community_farm = CommunityFarm.new
  end

  # GET /community_farms/1/edit
  def edit
  end

  # POST /community_farms
  # POST /community_farms.json
  def create
    @community_farm = CommunityFarm.new(community_farm_params)

    respond_to do |format|
      if @community_farm.save
        format.html { redirect_to @community_farm, notice: 'Community farm was successfully created.' }
        format.json { render :show, status: :created, location: @community_farm }
      else
        format.html { render :new }
        format.json { render json: @community_farm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /community_farms/1
  # PATCH/PUT /community_farms/1.json
  def update
    respond_to do |format|
      if @community_farm.update(community_farm_params)
        format.html { redirect_to @community_farm, notice: 'Community farm was successfully updated.' }
        format.json { render :show, status: :ok, location: @community_farm }
      else
        format.html { render :edit }
        format.json { render json: @community_farm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /community_farms/1
  # DELETE /community_farms/1.json
  def destroy
    @community_farm.destroy
    respond_to do |format|
      format.html { redirect_to community_farms_url, notice: 'Community farm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community_farm
      @community_farm = CommunityFarm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def community_farm_params
      params.require(:community_farm).permit(:raid_id, :department_id, :involve_member, :string)
    end
end
