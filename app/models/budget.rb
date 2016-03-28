class Budget < ActiveRecord::Base
  validates :amount, numericality: { only_integer: true }
  validates :source, presence: true
  def self.today
    where("created_at >= ?", Time.zone.now.beginning_of_day)
  end

  def self.last_per_day
    where(:created_at =>Budget.select("max(created_at) as created_at").group("date_trunc('day',created_at)"))
  end

  def self.summ(array)
    array.inject(0){ |result, elem| result + elem }
  end
end
