class DashboardController < ApplicationController
  def index
    @raids = Raid.all
  end
end
