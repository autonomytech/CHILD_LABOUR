module ApplicationHelper
  def is_active_controller(controller_name)
    (params[:controller].eql? controller_name) ? 'active' : nil
  end
end
