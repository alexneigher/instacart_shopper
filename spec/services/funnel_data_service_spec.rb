require "rails_helper"

RSpec.describe FunnelDataService do
  let!(:applied_applicant){ create(:applicant, workflow_state: :applied)}
  let!(:hired_applicant){ create(:applicant, workflow_state: :hired) }

  let(:funnel_data_service){ FunnelDataService.new }

  it 'returns applicants created within the range' do
    hash = funnel_data_service.perform
    expect(hash[hash.keys.last]).to eq({
      "applied"=>1, 
      "quiz_started"=>0, 
      "quiz_completed"=>0, 
      "onboarding_requested"=>0, 
      "onboarding_completed"=>0, 
      "hired"=>1, 
      "rejected"=>0
    })
  end

end