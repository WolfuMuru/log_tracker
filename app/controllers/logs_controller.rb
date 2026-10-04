class LogsController < ApplicationController
  def new
    @log = Log.new
  end

  def create
    log_file = params[:log][:log_file]

    json_data = Parser.call(log_file)

    log = Log.new(log_params)
    log.boss = Boss.find_by(name: find_boss(json_data))
    log.save!

    redirect_to root_path
  end

  private

  def log_params
    params.expect(log: [:log_file])
  end

  def find_boss(json_data)
    json_data["name"]
  end
end
