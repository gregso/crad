require 'rails_helper'

RSpec.describe Customer do

  describe "attributes" do
    let (:customer) { Customer.new}
    it "must have a name" do
      expect(customer).to respond_to :name
    end
  end

  describe "initialization" do
    let(:customer) { Customer.new }
    let(:cust_project_open) { CustomerProject.new({start_date:  2.days.ago,
      end_date: (1.month).since(Time.now)}) }
    let(:cust_project_done) { CustomerProject.new({start_date:  2.weeks.ago,
      end_date: (1.week).ago}) }

    it "considers a new Customer wth no projects as not active" do
      expect(customer).not_to be_active
    end

    it "considers a Customer with one open project as active" do
      customer.customer_projects << cust_project_open
      expect(customer).to be_active
    end
  end
end
