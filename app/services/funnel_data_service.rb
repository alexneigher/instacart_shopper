class FunnelDataService

  def initialize(params = {})
    @start_date = parse_user_date(params[:start_date]) || 1.month.ago.beginning_of_week
    @end_date = parse_user_date(params[:end_date]) || Date.current.end_of_week
  end


  def perform
    data = {}

    date_range_iterate(@start_date, @end_date, 1.week) do |t|

      beginning_of_range = t.beginning_of_week.strftime('%Y-%m-%d')
      end_of_range = t.end_of_week.strftime('%Y-%m-%d')

      applicants_in_range = applicants
        .select{ |a| a.created_at >= beginning_of_range && a.created_at <= end_of_range}

      data["#{beginning_of_range}-#{end_of_range}"] = workflow_state_count_hash(applicants_in_range)

    end

    return data

  end

  private

    def workflow_state_count_hash(applicants)
      data = {}
      Applicant::WORKFLOW_STATES.map do |state|
        data[state] = applicants.select{|a| a.workflow_state == state}.count
      end
      return data
    end

    def applicants
      @applicants ||= Applicant.all
    end

    def parse_user_date(date)
      return unless date.present?

      Date.parse(date)
    end

    def date_range_iterate(start_date, end_date, step, &block)
      begin
        yield(start_date)
      end while (start_date += step) <= end_date
    end
 
end