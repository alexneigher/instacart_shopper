FactoryGirl.define do
  factory :applicant do
    first_name 'Steve'
    last_name 'Magic'
    sequence(:email) {|n| "applicant#{n}@gmail.com" }
    sequence(:phone) {|n| "123#{n}345" }
    phone_type 'iPhone'
    region 'San Francisco'
  end
end