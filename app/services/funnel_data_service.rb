class FunnelDataService

  def initialize(params = {})
    @start_date = parse_user_date(params[:start_date])
    @end_date = parse_user_date(params[:end_date])
  end


  def perform
    data = []
    applicants.group_by(&:created_at).each do |a, created_at|
      data << a
    end
    
    return data
    #{sup: 'wow'}
  end

  private

    def applicants
      @applicants ||= Applicant.all
    end

    def parse_user_date(date)
      return unless date.present?

      Date.parse(date)
    end
 
end