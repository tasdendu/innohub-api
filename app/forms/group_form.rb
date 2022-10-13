# frozen_string_literal: true

class GroupForm < BaseForm
  def show
    group
  end

  def create
    group.save
  end

  def update
    group.update(params)
  end

  delegate :destroy, to: :group

  private

  def group
    @group ||= id ? Group.find(id) : current_user.groups.build(params)
  end
end
