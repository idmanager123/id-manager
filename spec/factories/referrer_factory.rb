FactoryGirl.define do
  factory :referrer do
    name "Example Referrer"

    factory :referrer_with_paid_customers, :parent => :referrer do
      after(:create) do |referrer|
        puts "creating paid customer"
        create_list(:customer,
                    10,
                    {referrer: referrer,
                     head_hunting_fee_paid: true})
        referrer.reload
      end
    end

    factory :referrer_with_unpaid_customers do
      after(:create) do |referrer|
        referrer.customers.zip(create_list(:customer,
                                           10,
                                           {referrer_id: referrer.id,
                                            head_hunting_fee_paid: true})).
                                           flatten.
                                           compact

        referrer.customers.zip(create_list(:customer,
                                           5,
                                           {referrer_id: referrer.id,
                                            head_hunting_fee_paid: false})).
                                           flatten.
                                           compact

        referrer.reload
      end
    end
  end
end
