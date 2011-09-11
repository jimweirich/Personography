class ActiveRecord::Base
  def in_db
    save!
    self
  end
end
