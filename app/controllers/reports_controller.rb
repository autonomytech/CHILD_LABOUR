class ReportsController < ApplicationController
  add_breadcrumb 'डॅशबोर्ड', :root_path
  add_breadcrumb 'अहवाल', :reports_path

  def child_labours
    @raid = Raid.find(params[:id])
    @child_labours = @raid.childlabours
    add_breadcrumb 'बाल कामगार'
  end

  def child_beggers
    @raid = Raid.find(params[:id])
    @child_beggers = @raid.childbeggers
    add_breadcrumb 'बाल भिक्षुक'
  end

  def panchnama
    @child_labour = Child.find(params[:id])
    @raid = @child_labour.raid
    add_breadcrumb 'पंचनामा'
  end

  def child_labour_years
    @years = Raid.child_labours_years
    add_breadcrumb 'वर्ष नुसार अहवाल'
  end

  def child_labour_year_wise_report
    @year = params[:year]
    @raids = Raid.cl_year_wise_report(@year)
  end

  def child_begger_years
    @years = Raid.child_beggers_years
    add_breadcrumb 'वर्ष नुसार अहवाल'
  end

  def child_begger_year_wise_report
    @year = params[:year]
    @raids = Raid.cb_year_wise_report(@year)
  end

  def all_over_child_labours
    @raids = Raid.where(raid_for: CHILD_LABOUR)
    @years = Raid.child_labours_years
    add_breadcrumb 'एकूण सर्व अहवाल'
  end

  def all_over_child_beggers
    @raids = Raid.where(raid_for: CHILD_BEGGER)
    @years = Raid.child_beggers_years
    add_breadcrumb 'एकूण सर्व अहवाल'
  end

  def download_pdf
    panchnama_pdf(params[:child_id]) if params[:type].eql? 'panchnama'
    child_labour_year_wise_report_pdf(params[:year]) \
    if params[:type].eql? 'cl_year_wise_report'
    child_begger_year_wise_report_pdf(params[:year]) \
    if params[:type].eql? 'cb_year_wise_report'
    all_over_child_labours_pdf if params[:type].eql? 'all_over_child_labours'
    all_over_child_beggers_pdf if params[:type].eql? 'all_over_child_beggers'
  end

  def all_over_child_labours_pdf
    @raids = Raid.where(raid_for: CHILD_LABOUR)
    @years = Raid.child_labours_years
    render pdf: 'all_over_child_labours', template: 'reports/all_over_child_labours.pdf.erb'
  end

   def all_over_child_beggers_pdf
    @raids = Raid.where(raid_for: CHILD_BEGGER)
    @years = Raid.child_beggers_years
    render pdf: 'all_over_child_beggers', template: 'reports/all_over_child_beggers.pdf.erb'
  end

  def child_labour_year_wise_report_pdf(year)
    @raids = Raid.cl_year_wise_report(year)
    render pdf: "#{year}_child_labour_year_report"\
    , template: 'reports/cl_year_wise_report.pdf.erb'
  end

  def child_begger_year_wise_report_pdf(year)
    @raids = Raid.cb_year_wise_report(year)
    render pdf: "#{year}_child_begger_year_report"\
    , template: 'reports/cb_year_wise_report.pdf.erb'
  end

  def panchnama_pdf(child_id)
    @child_labour = Child.find(child_id)
    @raid = @child_labour.raid
    render pdf: "#{@child_labour.id}_child_labour_panchnama"\
    , template: '/reports/panchnama.pdf.erb'
  end

  def panchnama_child_labour
    @raids = Raid.where(raid_for: CHILD_LABOUR)
  end

  def panchnama_child_begger
    @raids = Raid.where(raid_for: CHILD_BEGGER)
  end

  def get_child_labour
    childs = []
    params[:childs].each_char { |c| childs << c.to_i }
    @childs = Child.where(id: childs)
    raid = @childs.first.raid unless @childs
    render pdf: "#{raid ? raid.id : '1'}_raid_child_labour_panchnama"\
    , template: '/reports/get_child_labour.pdf.erb'
  end

  def get_child_begger
    childs = []
    params[:childs].each_char { |c| childs << c.to_i }
    @childs = Child.where(id: childs)
    raid = @childs.first.raid unless @childs
    render pdf: "#{raid ? raid.id : '1'}_raid_child_labour_panchnama"\
    , template: '/reports/get_child_begger.pdf.erb'
  end
end
