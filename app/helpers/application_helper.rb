module ApplicationHelper
  def app_name
    Rails.application.class.to_s.split('::')[0]
  end

  ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    html_tag.gsub('form-control', 'form-control is-invalid').html_safe
  end
end
