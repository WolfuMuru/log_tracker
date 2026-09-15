class LogsController < ApplicationController
  def new
    @log = Log.new
  end

  def create
    log = Log.new(log_params)
    log.boss = Boss.first
    log.save!
    redirect_to root_path
  end

  private

  def log_params
    params.expect(log: [:log_file])
  end
end
