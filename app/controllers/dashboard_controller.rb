class DashboardController < ApplicationController
  add_breadcrumb 'डॅशबोर्ड', :root_path

  def index
    @raids = Raid.all
  end
end
