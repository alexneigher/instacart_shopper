require "rails_helper"

RSpec.describe FunnelDataService do
  let(:funnel_data_service){ FunnelDataService.new }

  context 'when date params are present' do
    it 'returns applicants created within the range' do
      funnel_data_service.perform
    end
  end

  context 'when no date params are present' do
    it 'returns counts of all applicants' do
      funnel_data_service.perform
    end
  end

end