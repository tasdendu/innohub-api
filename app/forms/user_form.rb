# frozen_string_literal: true

class UserForm < BaseForm
  def show
    user
  end

  def update
    user.update(params)
  end

  delegate :destroy, to: :user

  private

  def user
    @user ||= User.includes(
      :roles
    ).find(id)
  end
end
