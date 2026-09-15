class BossesController < ApplicationController
  def index
    @bosses = Boss.all
    @logs = Log.all
  end
end
