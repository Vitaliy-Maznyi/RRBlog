module ApplicationHelper

  def gravatar_url(email, size)
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    default_url = 'https://www.gravatar.com/avatar/00000000000000000000000000000000'
    url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=#{CGI::escape(default_url)}"
  end

  BOOTSTRAP_FLASH_MSG = {
      success: 'alert-success',
      danger: 'alert-danger',
      alert: 'alert-block',
      notice: 'alert-info'
  }

  def bootstrap_class_for(flash_type)
    BOOTSTRAP_FLASH_MSG.fetch(flash_type.to_sym, flash_type.to_s)
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
        concat content_tag(:button, '×'.html_safe, class: "close", data: { dismiss: 'alert' })
        concat message
      end)
    end
    nil
  end

end
