class ChildrenController < ApplicationController
  before_action :set_raid, only: [:new, :create, :update, :destroy]
  before_action :set_child, only: [:update, :destroy]

  def new
    @child = @raid.children.build
    @questions = Question.all
    @child.addresses.build
  end

  def create
    @questions = Question.all
    @child = @raid.children.new(child_params)
    @child.employer_id = @raid.employers.first.id if @raid.employers.first
    @child.submited_by = current_user.id
    if @child.save
      create_answer(params[:answers])
      create_files(params[:files])
      flash[:notice] = CHILD_CREATE
      return redirect_to new_raid_child_path(@raid) \
      if params[:commit].eql? SAVE_NEXT
      return redirect_to dashboard_index_path \
      if params[:commit].eql? FINISH
      redirect_to_child(@child)
    else
      if (params[:commit].eql? SAVE_NEXT) || (params[:commit].eql? FINISH)
        render :new
      else
        if @child.is_child_begger
          render 'child_beggers/new'
        else
          render 'child_labours/new'
        end
      end
    end
  end

  def create_answer(answers)
    answers.each_pair do |k, v|
      @child.answers.create(question_id: k.to_i, answer: v[0].to_s)
    end
  end

  def update
    @questions = Question.all
    @child = @raid.children.find(params[:id])
    @child.addresses.destroy_all
    if @child.update(child_params)
      update_answers(params[:answers])
      create_files(params[:files])
      flash[:notice] = CHILD_UPDATE
      redirect_to_child(@child)
    else
      if @child.is_child_begger
        render 'child_beggers/edit'
      else
        render 'child_labours/edit'
      end
    end
  end

  def update_answers(answers)
    answers.each_pair do |k, v|
      ans = @child.answers.where(question_id: k.to_i).take
      ans.update(answer: v[0].to_s)
    end
  end

  def create_files(files)
    return unless files
    files.each { |file| @child.attachments.create(file: file) }
  end

  def redirect_to_child(child)
    if child.is_child_begger?
      redirect_to raid_child_beggers_path(child.raid)
    else
      redirect_to raid_child_labours_path(child.raid)
    end
  end

  def destroy
    @child.update(is_deleted: true)
    flash[:notice] = CHILD_DELETE
    redirect_to_child(@child)
  end

  private

  def set_raid
    @raid = Raid.find(params[:raid_id])
    @department = @raid.community_farms.first.department
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_child
    @child = Child.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def child_params
    params.require(:child).permit(:first_name, :last_name, :father_name, :mother_name\
      , :gender, :age, :pet_name, :mother_tongue, :description, :submited_by, :employer_id, :is_child_begger\
      , addresses_attributes: [:address_line_1, :address_line_2\
      , :city, :state, :pincode])
  end
end
