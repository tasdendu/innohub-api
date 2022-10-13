# frozen_string_literal: true

class GroupPopulator < BasePopulator
  def run
    groups
      .public_send(:search, q)
  end

  private

  def groups
    @groups ||= parent ? parent.groups : Group
  end
end
