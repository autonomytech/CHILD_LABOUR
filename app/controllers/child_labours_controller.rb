class ChildLaboursController < ApplicationController
  before_action :set_child_labour, only: [:show, :edit, :update, :destroy]

  # GET /child_labours
  # GET /child_labours.json
  def index
    @child_labours = ChildLabour.all
  end

  # GET /child_labours/1
  # GET /child_labours/1.json
  def show
  end

  # GET /child_labours/new
  def new
    @raid = params[:format]
    @child_labour = ChildLabour.new
    employer = @child_labour.build_employer 
  end

  # GET /child_labours/1/edit
  def edit
  end

  # POST /child_labours
  # POST /child_labours.json
  def create
    @child_labour = ChildLabour.new(child_labour_params)
    @raid = params[:raid_id]
    respond_to do |format|
      if @child_labour.save
        @child_labour.update(raid_id:@raid)
        format.html { redirect_to @child_labour, notice: 'Child labour was successfully created.' }
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
    respond_to do |format|
      if @child_labour.update(child_labour_params)
        format.html { redirect_to @child_labour, notice: 'Child labour was successfully updated.' }
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
    @child_labour.destroy
    respond_to do |format|
      format.html { redirect_to child_labours_url, notice: 'Child labour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_child_labour
      @child_labour = ChildLabour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def child_labour_params
      params.require(:child_labour).permit(:name, :father_name, :mother_name, :address, 
                                           :age, :employer_id,:is_deleted,:raid_id, :description, 
                                           employer_attributes:[:first_name,:middle_name,:last_name,
                                            :address,:contact_no])
    end
end
