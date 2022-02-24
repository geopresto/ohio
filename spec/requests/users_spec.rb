# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  context 'signing up' do
    subject(:user) { User.create }

    it 'user is successfully saved' do
      expect(user).to be_valid
      expect(user).to be_a_new(User)
      expect(response).to redirect_to(root_url)
    end
  end
end
