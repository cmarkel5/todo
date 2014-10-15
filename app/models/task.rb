class Task < ActiveRecord::Base
  validates :title, presence: true, length: { in: 3..254 }
  validates :priority, inclusion: 0..3
  validates :location, length: { maximum: 254 }

  before_save :set_due_at #this is a hook/callback

  def set_due_at
    self.due_at ||= Date.today
  end

end