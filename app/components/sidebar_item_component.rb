# frozen_string_literal: true

class SidebarItemComponent < ViewComponent::Base
  attr_reader :path, :name, :fa_icon

  def initialize(path:, name:, fa_icon:)
    @path = path
    @name = name
    @fa_icon = fa_icon
    super
  end
end
