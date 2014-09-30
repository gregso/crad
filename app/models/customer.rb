class Customer
  attr_accessor :customer_projects,:name

  def initialize(args={})
    @customer_projects = []
    @name = args[:name]
  end

  def open_projects
    customer_projects.select(&:open?)
  end

  def active?
    not open_projects.empty?
  end
end
