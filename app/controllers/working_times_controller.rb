class WorkingTimesController < ApplicationController
  protect_from_forgery except: %w[start end]

  def index; end

  def start
    WorkingTime.start
  end

  def end
    WorkingTime.end
  end
end
