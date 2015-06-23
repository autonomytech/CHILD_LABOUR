class ChildLaboursController < ApplicationController
  add_breadcrumb 'डॅशबोर्ड', :root_path
  add_breadcrumb 'बाल कामगार', :child_labours_path
  before_action :set_raid, only: [:new, :edit]
  before_action :set_child, only: [:show, :edit]

  # GET /child_labours
  # GET /child_labours.json
  def index
    if params[:raid_id]
      @raid = Raid.find(params[:raid_id])
      @child_labours = @raid.childlabours
    else
      @child_labours = Child.child_labour
    end
  end

  # GET /child_labours/1
  # GET /child_labours/1.json
  def show
  end

  # GET /child_labours/new
  def new
    @child = @raid.children.build
    @questions = Question.all
    @child.addresses.build
  end

  # GET /child_labours/1/edit
  def edit
    @questions = Question.all
    @child = @raid.children.find(params[:id])
  end

  # POST /child_labours
  # POST /child_labours.json

  # PATCH/PUT /child_labours/1
  # PATCH/PUT /child_labours/1.json

  # DELETE /child_labours/1
  # DELETE /child_labours/1.json

  private

  def set_raid
    @raid = Raid.find(params[:raid_id])
    @department = @raid.community_farms.first.department
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_child
    @child = Child.find(params[:id])
  end
end
