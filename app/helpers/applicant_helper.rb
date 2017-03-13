module ApplicantHelper

  def application_status_indicator(applicant)
    status = (applicant.workflow_state == 'hired')? 'success' : 'warning'
    content_tag :span, class: "label label-#{status}" do
      applicant.workflow_state
    end
  end

end