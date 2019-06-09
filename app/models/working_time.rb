class WorkingTime < ApplicationRecord
  def self.start
    create(date: Time.now, start_at: Time.now)
  end

  def self.end
    today = find_by(date: Time.now)
    if today
      today.update(end_at: Time.now)
    else
      today = create(date: Time.now, end_at: Time.now)
    end
    today
  end
end
