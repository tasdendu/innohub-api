# frozen_string_literal: true

class UserPopulator < BasePopulator
  attr_accessor :q, :status, :roles, :departments, :grades, :sections

  def run
    users
      .then { |users| role_filters(users) }
      .then { |users| status_filters(users) }
      .public_send(:search, q)
  end

  private

  def role_filters(users)
    return users unless roles&.any?(&:present?)

    users.filter_by_roles(roles)
  end

  def status_filters(users)
    return users if status.blank?

    users.filter_by_status(determine_status)
  end

  def users
    @users ||= User.includes(
      :roles,
      :roles_users
    )
  end

  def determine_status
    [true, 'true'].include?(status)
  end
end
