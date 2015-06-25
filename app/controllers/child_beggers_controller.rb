class ChildBeggersController < ApplicationController
  add_breadcrumb 'डॅशबोर्ड', :root_path
  add_breadcrumb 'बाल भिक्षुक', :child_beggers_path
  before_action :set_raid, only: [:new, :edit]
  before_action :set_child, only: [:show, :edit]

  # GET /child_beggers
  # GET /child_beggers.json
  def index
    if params[:raid_id]
      @raid = Raid.find(params[:raid_id])
      @child_beggers = @raid.childbeggers
    else
      @child_beggers = Child.child_begger
    end
  end

  # GET /child_beggers/1
  # GET /child_beggers/1.json
  def show
  end

  # GET /child_beggers/new
  def new
    @child = @raid.children.build
    @questions = Question.all
    @child.addresses.build
  end

  # GET /child_beggers/1/edit
  def edit
    @questions = Question.all
    @child = @raid.children.find(params[:id])
  end

  # POST /child_beggers
  # POST /child_beggers.json
  

  # PATCH/PUT /child_beggers/1
  # PATCH/PUT /child_beggers/1.json

  # DELETE /child_beggers/1
  # DELETE /child_beggers/1.json

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
