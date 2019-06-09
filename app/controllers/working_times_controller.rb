class WorkingTimesController < ApplicationController
  protect_from_forgery except: %w[start end]

  def index; end

  def list
    list = WorkingTime.all
    render json: { logs: list }
  end

  def start
    WorkingTime.start
  end

  def end
    WorkingTime.end
  end
end
