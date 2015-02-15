require 'spec_helper'
require 'finance/referrer_report'

describe Finance::ReferrerReport do
  let(:referrer) { FactoryGirl.create(:referrer_with_unpaid_customers) }
  let(:referrer_report) { Finance::ReferrerReport.new referrer }
  describe "#amount_paid" do
    it "should determine profit" do
      # for some reason I have to access the referrer_id for it to work
      expect(referrer_report.amount_paid).to eq 50
    end
  end

  describe "#amount_owed" do
    it "should return the delta between paid and total owed" do
      expect(referrer_report.amount_owed).to eq 25
    end
  end
end
