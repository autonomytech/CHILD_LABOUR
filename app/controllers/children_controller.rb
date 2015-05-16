class ChildrenController < ApplicationController
  before_action :set_raid, only: [:new, :create, :update, :destroy]
  before_action :set_child, only: [:update, :destroy]

  def new
    @child = @raid.children.build
    @questions = Question.all
    @child.answers.build
    @child.addresses.build
  end

  def create
    @questions = Question.all
    @child = @raid.children.new(child_params)
    @child.employer_id = @raid.employers.first.id if @raid.employers.first
    @child.submited_by = current_user.id
    if @child.save
      flash[:notice] = 'Child was successfully created.'
      return redirect_to new_raid_child_path(@raid) \
      if params[:commit].eql? SAVE_NEXT
      return redirect_to dashboard_index_path \
      if params[:commit].eql? FINISH
      redirect_to_child(@child)
    else
      render :new
    end
  end

  def update
    @child = @raid.children.find(params[:id])
    answers_attributes = params[:child][:answers_attributes]
    @child.addresses.destroy_all
    if @child.update(child_update_params)
      update_answers(answers_attributes)
      flash[:notice] = 'Child was successfully updated.'
      redirect_to_child(@child)
    else
      render :edit
    end
  end

  def update_answers(answers_attributes)
    answers_attributes.each_pair do |_k, v|
      ans = Answer.find(v[:id])
      next if ans.answer.eql? v[:answer]
      ans.update(answer: v[:answer])
    end
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
    flash[:notice] = 'Child was successfully deleted.'
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
      , :gender, :age, :description, :submited_by, :employer_id\
      , answers_attributes: [:answer, :question_id]\
      , addresses_attributes: [:address_line_1, :address_line_2\
      , :city, :state, :pincode])
  end

  def child_update_params
    params.require(:child).permit(:first_name, :last_name, :father_name, :mother_name\
      , :gender, :age, :description, :submited_by, :employer_id\
      , addresses_attributes: [:address_line_1, :address_line_2\
      , :city, :state, :pincode])
  end
end
