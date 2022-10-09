# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:user) { create(:user) }
  let!(:user1) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:admin) { create(:admin) }

  describe 'As a admin' do
    before do
      sign_in(admin)
    end

    it 'sees the list of users' do
      get api_v1_users_path
      expect(status).to eq(200)
      expect(json[:data].size).to eq(4)
    end

    it 'check others user' do
      get api_v1_user_path(user)
      expect(status).to eq(200)
      expect(json.dig(:data, :id).to_i).to eq(user.id)
    end

    it 'check his/her profile' do
      get profile_api_v1_users_path
      expect(status).to eq(200)
      expect(json.dig(:data, :id).to_i).to eq(admin.id)
    end

    it 'admin should be able to delete the user' do
      delete api_v1_user_path(user)
      expect(status).to eq(200)
    end

    it 'filter user by roles' do
      get api_v1_users_path, params: { roles: [2] }
      expect(status).to eq(200)
    end

    it 'filter user by status' do
      get api_v1_users_path, params: { status: true }
      expect(status).to eq(200)
    end

    it 'activates & deactivate user' do
      put api_v1_user_path(user), params: { user: { active: false } }
      expect(status).to eq(200)
      expect(json.dig(:data, :attributes, :active)).to be(false)
    end
  end

  describe 'As a normal user' do
    before do
      sign_in(user)
    end

    it 'is not able to see the list of user' do
      get api_v1_users_path, params: {}
      expect(status).to eq(403)
      expect(json[:errors]).to eq([I18n.t('pundit')])
    end

    it 'does not permit to activate or deactivate user' do
      put api_v1_user_path(user), params: { user: { active: false } }
      expect(status).to eq(403)
      expect(json[:errors]).to eq([I18n.t('pundit')])
    end

    it 'does not allow to see other user details' do
      get api_v1_user_path(user), params: {}
      expect(status).to eq(403)
      expect(json[:errors]).to eq([I18n.t('pundit')])
    end

    it 'does not allowed to delete other user' do
      delete api_v1_user_path(user), params: {}
      expect(status).to eq(403)
      expect(json[:errors]).to eq([I18n.t('pundit')])
    end
  end

  describe 'Anonymous user' do
    it 'Unable to login' do
      admin.assign_attributes(email: Faker::Internet.email)
      sign_in(admin)
      expect(json[:error]).to eq(I18n.t('devise.failure.invalid', authentication_keys: 'Login'))
    end
  end
end
