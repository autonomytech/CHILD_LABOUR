class ComplaintsController < ApplicationController
  add_breadcrumb 'Dashboard', :root_path
  add_breadcrumb 'Complaint', :new_complaint_path
  before_action :set_complaint, only: [:show, :edit, :update, :destroy]

  # GET /complaints
  # GET /complaints.json
  def index
    @complaints = Complaint.all
  end

  # GET /complaints/1
  # GET /complaints/1.json
  def show
  end

  # GET /complaints/new
  def new
    @complaint = Complaint.new
    @complaint.build_employer
    @complaint.employer.addresses.build
  end

  # GET /complaints/1/edit
  def edit
  end

  # POST /complaints
  # POST /complaints.json
  def create
    @complaint = Complaint.new(complaint_params)

    respond_to do |format|
      if @complaint.save
        raid = create_raid(@complaint)
        format.html { redirect_to edit_raid_path(raid.id), notice: 'Complaint was successfully created.' }
        format.json { render :show, status: :created, location: @complaint }
      else
        format.html { render :new }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_raid(complaint)
    raid = Raid.new
    raid.title = "Raid-#{complaint.id}"
    raid.description = complaint.description
    raid.raid_for = complaint.subject
    raid.datetime = Date.today.to_date
    raid.complaint_id = complaint.id
    raid.location_id = location_for_raid(complaint.area)
    raid.save
    complaint.employer.update(raid_id: raid.id)
    raid
  end

  def location_for_raid(area)
    location = Location.where(name: area.capitalize).take
    return location.id if location
    location = Location.create(name: area.capitalize)
    location.id
  end

  # PATCH/PUT /complaints/1
  # PATCH/PUT /complaints/1.json
  def update
    respond_to do |format|
      if @complaint.update(complaint_params)
        format.html { redirect_to @complaint, notice: 'Complaint was successfully updated.' }
        format.json { render :show, status: :ok, location: @complaint }
      else
        format.html { render :edit }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /complaints/1
  # DELETE /complaints/1.json
  def destroy
    @complaint.destroy
    respond_to do |format|
      format.html { redirect_to complaints_url, notice: 'Complaint was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_complaint
    @complaint = Complaint.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def complaint_params
    params.require(:complaint).permit(:first_name, :middle_name, :last_name\
      , :contact_no, :email, :area, :subject, :last_seen_date, :description\
      , employer_attributes: [:first_name, :middle_name, :last_name\
      , :contact_no, addresses_attributes: [:address_line_1, :address_line_2\
      , :city, :state, :pincode]])
  end
end