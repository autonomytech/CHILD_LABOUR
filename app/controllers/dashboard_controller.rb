class DashboardController < ApplicationController
  add_breadcrumb 'Dashboard', :root_path

  def index
    @raids = Raid.all
  end
end
