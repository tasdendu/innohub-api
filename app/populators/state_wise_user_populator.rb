# frozen_string_literal: true

class StateWiseUserPopulator < BasePopulator
  def run
    state_wise_users
  end

  private

  def users
    @users ||= User.includes(:profile, :profile_photo, :cover_photo)
  end

  def state_wise_users
    users.group_by(&:state).map do |k, v|
      Struct.new(:id, :key, :value).new(k, k, v.size)
    end
  end
end
