class Flight < ActiveRecord::Base
  validates_presence_of :origin, :destination, :price
  validates_numericality_of :price,
                            greater_than_or_equal_to: 0,
                            less_than_or_equal_to: 999999.99
  validates :date_of_journey, date: true
  validates :departure_time, :arrival_time, datetime: true
  validate :date_of_journey_is_not_less_than_today
  validate :departure_time_is_not_less_than_now
  validate :arrival_time_is_after_departure_time
  validate :date_of_journey_is_same_as_date_in_departure_time

  def date_of_journey_is_not_less_than_today
    errors.add(:date_of_journey, "must be today or after today") if (date_of_journey.nil? || date_of_journey < Date.today)
  end
  
  def departure_time_is_not_less_than_now
    errors.add(:departure_time, "must be after now") if (departure_time.nil? || departure_time.localtime < Time.now)
  end

  def arrival_time_is_after_departure_time
    errors.add(:arrival_time, "must be after departure time") if (arrival_time.nil? || departure_time.nil? || departure_time >= arrival_time)
  end

  def date_of_journey_is_same_as_date_in_departure_time
    errors.add(:departure_time, "must be on date of journey") if (departure_time.nil? || date_of_journey.nil? || date_of_journey != departure_time.localtime.to_date)
  end
end
