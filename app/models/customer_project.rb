class CustomerProject
  attr_accessor :start_date,:end_date,:name,:project_type


  def initialize(args = {})
    @start_date = args[:start_date]
    @end_date = args[:end_date]
    raise ArgumentError, "Start date must be earlier than end date" if (@start_date && @end_date) && (@end_date < @start_date)
    @project_type = args[:project_type]
    @name = args[:name]

  end

  def open?
    return false if (@start_date.nil? || @start_date > Time.now)
    return true if (@end_date.nil? || @end_date > Time.now)
    return false if @end_date <= Time.now
  end


end
