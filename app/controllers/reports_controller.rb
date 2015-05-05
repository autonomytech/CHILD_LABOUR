class ReportsController < ApplicationController
  add_breadcrumb 'Dashboard', :root_path
  add_breadcrumb 'Reports', :reports_path

  def child_labours
    @child_labours = ChildLabour.where(is_deleted: false)
    add_breadcrumb 'Child Labours'
  end

  def panchnama
    @child_labour = ChildLabour.find(params[:id])
    add_breadcrumb 'Child Labours', :child_labours_reports_path
    add_breadcrumb 'Panchnama'
  end

  def years
    @years = Raid.years
    add_breadcrumb 'Year Wise Reports'
  end

  def year_wise_report
    @raids = Raid.year_wise_report(params[:year])
  end

  def all_over_report
    @raids = Raid.all
    @years = Raid.years
    add_breadcrumb 'All over report'
  end
end
