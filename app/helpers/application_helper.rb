module ApplicationHelper
  def is_active_controller(controller_name)
    (params[:controller].eql? controller_name) ? 'active' : nil
  end

  def total_fir(year)
    @raids.select { |d| d.date.strftime('%Y').eql? year }.count
  end

  def victam_in_jail(year)
    @raids.select \
   { |d| (d.date.strftime('%Y').eql? year) && (d.child_labours.present?) }.count
  end

  def free_child_labour(year)
    count = 0
    @raids.each \
    { |d| (count += d.child_labours.count if d.date.strftime('%Y').eql? year) }
    count
  end

  def child_labours(raid)
    name = ''
    age = ''
    raid.child_labours.each_with_index do |c, i|
      name += "#{i + 1}. #{c.name}<br/>"
      age += "#{c.age}<br/>"
    end
    [name, age]
  end
end
