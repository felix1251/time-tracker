# frozen_string_literal: true

module ApplicationHelper
  require 'time'

  def time_diff(time1, time2)
    diff = time2 - time1
    hours, diff = diff.divmod(3600)
    mins,  diff = diff.divmod(60)

    "#{format('%02d', hours.to_i)}:#{format('%02d', mins.to_i)}:#{format('%02d', diff.to_i)}"
  end
end
