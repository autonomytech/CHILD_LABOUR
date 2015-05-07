class ReportsController < ApplicationController
  add_breadcrumb 'Dashboard', :root_path
  add_breadcrumb 'Reports', :reports_path

  def child_labours
    @child_labours = ChildLabour.where(is_deleted: false)
    add_breadcrumb 'Child Labours'
  end

  def panchnama
    @child_labour = ChildLabour.find(params[:id])
    @raid = @child_labour.raid
    add_breadcrumb 'Child Labours', :child_labours_reports_path
    add_breadcrumb 'Panchnama'
  end

  def years
    @years = Raid.years
    add_breadcrumb 'Year Wise Reports'
  end

  def year_wise_report
    @year = params[:year]
    @raids = Raid.year_wise_report(@year)
  end

  def all_over_report
    @raids = Raid.all
    @years = Raid.years
    add_breadcrumb 'All over report'
  end

  def download_pdf
    panchnama_pdf(params[:child_id]) if params[:type].eql? 'panchnama'
    year_wise_report_pdf(params[:year]) \
    if params[:type].eql? 'year_wise_report'
    all_over_report_pdf if params[:type].eql? 'all_over_report'
  end

  def all_over_report_pdf
    @raids = Raid.all
    @years = Raid.years
    render pdf: 'all_over_report', template: 'reports/all_over_report.pdf.erb'
  end

  def year_wise_report_pdf(year)
    @raids = Raid.year_wise_report(year)
    render pdf: "#{year}_year_report"\
    , template: 'reports/year_wise_report.pdf.erb'
  end

  def panchnama_pdf(child_id)
    @child_labour = ChildLabour.find(child_id)
    @raid = @child_labour.raid
    render pdf: "#{@child_labour.id}_child_labour_panchnama"\
    , template: '/reports/panchnama.pdf.erb'
  end
end
