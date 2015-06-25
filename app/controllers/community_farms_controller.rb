class CommunityFarmsController < ApplicationController
  add_breadcrumb 'डॅशबोर्ड', :root_path
  before_action :set_raid_location, only: [:new, :edit, :create, :update, :community_farm, :create_community_farm]
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
    @community_farm = @raid.community_farms.build
    @community_farm.department_id = @location.departments.first.id \
    if @location.departments.present?
    add_breadcrumb 'समिती दल'
  end

  def community_farm
    @community_farm = @raid.community_farms.build
    @community_farm.department_id = @location.departments.first.id \
    if @location.departments.present?
    add_breadcrumb 'समिती दल'
  end

  # GET /community_farms/1/edit
  def edit
    @community_farm = @raid.community_farms.find(params[:id])
    add_breadcrumb 'समिती दल'
  end

  # POST /community_farms
  # POST /community_farms.json
  def create
    @community_farm = @raid.community_farms.new(community_farm_params)
    @community_farm.submited_by = current_user.id
    respond_to do |format|
      if @community_farm.save
        format.html { redirect_to dashboard_index_path, notice: COMMUNITY_ASSIGN }
        format.json { render :show, status: :created, location: @community_farm }
      else
        format.html { render :new }
        format.json { render json: @community_farm.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_community_farm
    @community_farm = @raid.community_farms.new(community_farm_params)
    @community_farm.submited_by = current_user.id
    respond_to do |format|
      if @community_farm.save
        format.html { redirect_to new_raid_child_path(@raid), notice: COMMUNITY_ASSIGN }
        format.json { render :show, status: :created, location: @community_farm }
      else
        format.html { render :community_farm }
        format.json { render json: @community_farm.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /community_farms/1
  # PATCH/PUT /community_farms/1.json
  def update
    @community_farm = @raid.community_farms.find(params[:id])
    respond_to do |format|
      if @community_farm.update(community_farm_params)
        format.html { redirect_to dashboard_index_path, notice: COMMUNITY_ASSIGN }
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

    def set_raid_location
      @raid = Raid.find(params[:raid_id])
      @departments = Department.all.collect { |d| [d.name, d.id] }
      @location = @raid.location
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_community_farm
      @community_farm = CommunityFarm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def community_farm_params
      params.require(:community_farm).permit(:raid_id, :department_id, :involve_member,
                                             :submited_by,:ngo_name,:person_name)
    end
end
