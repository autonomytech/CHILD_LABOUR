module ApplicationHelper
  def is_active_controller(controller_name)
    (params[:controller].eql? controller_name) ? 'active' : nil
  end

  def total_fir(year)
    @raids.select { |d| d.datetime.strftime('%Y').eql? year }.count
  end

  def victam_in_jail(year)
    @raids.select \
   { |d| (d.datetime.strftime('%Y').eql? year) && (d.childlabours.present?) }.count
  end

  def free_child_labour(year)
    count = 0
    @raids.each \
    { |d| (count += d.childlabours.count if d.datetime.strftime('%Y').eql? year) }
    count
  end

  def child_labours(raid)
    name = ''
    age = ''
    raid.childlabours.each_with_index do |c, i|
      name += "#{i + 1}. #{c.full_name}<br/>"
      age += "#{c.age}<br/>"
    end
    [name, age]
  end
end
