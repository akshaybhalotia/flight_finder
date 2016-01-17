class Search < ActiveRecord::Base
  validates_presence_of :from_location, :to_location
  validates :date_of_journey, date: true
  validate :date_of_journey_is_not_less_than_today
  
  def date_of_journey_is_not_less_than_today
    errors.add(:date_of_journey, "must be today or after today") if (date_of_journey.nil? || date_of_journey < Date.today)
  end
end
