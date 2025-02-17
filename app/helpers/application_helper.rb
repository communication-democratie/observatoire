module ApplicationHelper
  def controller_class
    "#{controller_name.gsub('/', '--')}"
  end

  def body_classes(additional_body_class = '')
    classes = "controller-#{controller_class}"
    classes += " action-#{action_name}"
    classes += " #{controller_class}-#{action_name}"
    classes += " #{additional_body_class}" if additional_body_class.present?
    classes
  end

  def button_classes
    'btn btn-primary'
  end
end
