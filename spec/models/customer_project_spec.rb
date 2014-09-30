require 'rails_helper'

RSpec.describe CustomerProject do
  let (:cp_new) { CustomerProject.new({name: "MAYO",project_type: "ProductionSupport"})}
  let(:cust_project_open_noend) { CustomerProject.new({start_date:  2.days.ago }) }
  let(:cust_project_open) { CustomerProject.new({start_date:  2.days.ago,
                                                 end_date: (1.month).since(Time.now)}) }
  let(:cust_project_done) { CustomerProject.new({start_date:  2.weeks.ago,
                                                 end_date: (1.week).ago}) }
  let(:cust_project_future) { CustomerProject.new({start_date:  1.day.since(Time.now),
                                                   end_date: (1.week).since(Time.now)})}

  let(:cust_improper_dates) { CustomerProject.new(
        {start_date: (1.week).since(Time.now), end_date: 1.week.ago}) }

  describe "attributes" do
    it "must have a name" do
      expect(cp_new).to respond_to :name
    end
    it "must have a type" do
      expect(cp_new).to respond_to :project_type
    end
    it "recognizes its status" do
      expect(cp_new).not_to be_open
    end
    it "does not allow to set start date later than  end date" do
      expect{cust_improper_dates}.to raise_error( ArgumentError)
      expect{cust_project_done}.not_to raise_error
    end

  end

  describe "initialization" do


    it "considers new project without dates as not open" do
      expect(cp_new).not_to be_open
    end

    it "considers project with past start date and no end date as open" do
      expect(cust_project_open_noend).to be_open
    end

    it "considers project with past start date and past end date as not open" do
      expect(cust_project_done).not_to be_open
    end

    it "considers project with past start date and future end date as open" do
      expect(cust_project_open).to be_open
    end

    it "considers project with future start date and future end date as not open" do
      expect(cust_project_future).not_to be_open
    end

  end
end
