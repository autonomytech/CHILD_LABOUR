class ChildLaboursController < ApplicationController
  add_breadcrumb 'Dashboard', :root_path
  add_breadcrumb 'Child Labours', :child_labours_path
  before_action :set_raid, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_child_labour, only: [:show, :edit, :update, :destroy]

  # GET /child_labours
  # GET /child_labours.json
  def index
    if params[:raid_id]
      @raid = Raid.find(params[:raid_id])
      @child_labours = @raid.child_labours.where(is_deleted: false)
    else
      @child_labours = ChildLabour.where(is_deleted: false)
    end
  end

  # GET /child_labours/1
  # GET /child_labours/1.json
  def show
  end

  # GET /child_labours/new
  def new
    @child_labour = @raid.child_labours.build
    @child_labour.build_employer
    @child_labour.employer = @raid.child_labours.first.employer
  end

  # GET /child_labours/1/edit
  def edit
    @child_labour = @raid.child_labours.find(params[:id])
  end

  # POST /child_labours
  # POST /child_labours.json
  def create
    if @raid.child_labours_blank?
      @child_labour = @raid.child_labours.new(child_labour2_params)
    else
      @child_labour = @raid.child_labours.new(child_labour_params)
      @child_labour.employer_id = @raid.child_labours.first.employer_id
    end
    @child_labour.submited_by = current_user.id
    respond_to do |format|
      if @child_labour.save
        format.html { redirect_to raid_child_labours_path(@raid), notice: 'Child labour was successfully created.' }
        format.json { render :show, status: :created, location: @child_labour }
      else
        format.html { render :new }
        format.json { render json: @child_labour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /child_labours/1
  # PATCH/PUT /child_labours/1.json
  def update
    @child_labour = @raid.child_labours.find(params[:id])
    respond_to do |format|
      if @child_labour.update(child_labour_params)
        format.html { redirect_to raid_child_labours_path(@raid), notice: 'Child labour was successfully updated.' }
        format.json { render :show, status: :ok, location: @child_labour }
      else
        format.html { render :edit }
        format.json { render json: @child_labour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /child_labours/1
  # DELETE /child_labours/1.json
  def destroy
    @child_labour.update(is_deleted: true)
    respond_to do |format|
      format.html { redirect_to raid_child_labours_path(@raid), notice: 'Child labour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_raid
    @raid = Raid.find(params[:raid_id])
    @department = @raid.location.departments.first
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_child_labour
    @child_labour = ChildLabour.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def child_labour_params
    params.require(:child_labour).permit(:name, :father_name, :mother_name\
      , :address, :age, :description, :submited_by)
  end

  def child_labour2_params
    params.require(:child_labour).permit(:name, :father_name, :mother_name\
      , :address, :age, :description, :submited_by\
      , employer_attributes: [:first_name, :middle_name, :last_name\
      , :contact_no, :address])
  end
end
