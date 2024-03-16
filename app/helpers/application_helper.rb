# frozen_string_literal: true

module ApplicationHelper
  require 'time'

  def time_diff(time1, time2)
    diff = time2.to_i - time1.to_i
    hours, diff = diff.divmod(3600)
    mins,  diff = diff.divmod(60)

    "#{format('%02d', hours)}:#{format('%02d', mins)}:#{format('%02d', diff)}"
  end
end
