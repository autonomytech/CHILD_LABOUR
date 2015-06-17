class EmployersController < ApplicationController
  add_breadcrumb 'Dashboard', :root_path
  add_breadcrumb 'Employers', :employers_path
  before_action :set_employer, only: [:show, :edit, :update, :destroy]

  # GET /employers
  # GET /employers.json
  def index
    if params[:raid_id]
      @raid = Raid.find(params[:raid_id])
      @employers = @raid.employers.where(is_deleted: false)
    else
      @employers = Employer.where(is_deleted: false)
    end
  end

  # GET /employers/1
  # GET /employers/1.json
  def show
  end

  # GET /employers/new
  def new
    @employer = Employer.new
    @laws = Law.all
  end

  # GET /employers/1/edit
  def edit
    @laws = Law.all
  end

  # POST /employers
  # POST /employers.json
  def create
    @employer = Employer.new(employer_params)
    if @employer.save
      create_files(params[:files])
      employer_section(params[:laws], params[:acts], params[:sections])
      redirect_to @employer, notice: 'Employer was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /employers/1
  # PATCH/PUT /employers/1.json
  def update
    @employer.addresses.destroy_all
    if @employer.update(employer_params)
      create_files(params[:files])
      employer_section(params[:laws], params[:acts], params[:sections])
      redirect_to employers_path, notice: 'Employer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /employers/1
  # DELETE /employers/1.json
  def destroy
    @employer.update(is_deleted: true)
    respond_to do |format|
      format.html { redirect_to employers_url, notice: 'Employer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create_files(files)
    return unless files
    files.each { |file| @employer.attachments.create(file: file) }
  end

  def employer_section(laws, acts, sections)
    law = laws.blank? ? '' : laws.join(', ')
    act = acts.blank? ? '' : acts.join(', ')
    section = sections.blank? ? '' : sections.join(', ')
    emp_sect = @employer.employer_sections
    if emp_sect.first
      emp_sect.first.update(laws: law, acts: act, sections: section)
    else
      emp_sect.create(laws: law, acts: act, sections: section)
    end
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_employer
    @employer = Employer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def employer_params
    params.require(:employer).permit(:first_name, :middle_name, :last_name\
      , :contact_no, :is_deleted, addresses_attributes: [:address_line_1\
      , :address_line_2, :city, :state, :pincode])
  end
end
