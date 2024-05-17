class BirdCount
  def self.last_week
    [0, 2, 5, 3, 7, 8, 4]
  end

  def initialize(birds_per_day)
    @birds_per_day = birds_per_day
  end

  def yesterday
    @birds_per_day[-2]
  end

  def total
    @birds_per_day.reduce(:+)
  end

  def busy_days
    raise 'Please implement the BirdCount#busy_days method'
  end

  def day_without_birds?
    raise 'Please implement the BirdCount#day_without_birds method'
  end
end
