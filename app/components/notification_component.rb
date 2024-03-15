# frozen_string_literal: true

class NotificationComponent < ViewComponent::Base
  attr_reader :notif_type, :message, :duration

  def initialize(message:, notif_type: 'success', duration: '4000')
    @notif_type = notif_type
    @message = message
    @duration = duration
    super
  end

  def conditional_style
    default = 'bg-green-600 text-green-200'
    case notif_type
    when 'success'
      return default
    when 'error'
      return 'bg-red-600 text-red-200'
    when 'warn'
      return 'bg-yellow-600 text-yellow-200'
    end

    default
  end
end
