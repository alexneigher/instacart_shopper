module ApplicantHelper

  def application_status_indicator(applicant)
    status = applicant_status_to_class_name(applicant.workflow_state)
    content_tag :span, class: "label label-#{status}" do
      applicant.workflow_state
    end
  end

  def applicant_status_to_class_name(status)
    case status
      when 'hired'
        'success'
      when 'rejected'
        'danger'
      else
        'warning'
      end
  end

end