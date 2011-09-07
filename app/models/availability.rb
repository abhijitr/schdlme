class Availability < ActiveRecord::Base
  belongs_to :meeting

  def start=(start)
	write_attribute(:start, self.normalize_date(start))
  end

  def end=(end_date)
    write_attribute(:end, self.normalize_date(end_date))
  end

  def normalize_date(date)
	if date.is_a? String
      date = Time.strptime(date, "%m/%d/%Y %H:%M")	
	end
    date
  end

end
