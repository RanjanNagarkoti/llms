require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe User, type: :model do
  context 'email validations' do
    let(:user) { FactoryBot.build(:user, email: email_attr_value) }

    context 'with valid email' do
      let(:email_attr_value) { 'Mario@gmail.com' }

      it 'is valid' do
        expect(user).to be_valid
      end
    end

    context 'with duplicate email' do
      let(:email_attr_value) { 'duplicate_email@gmail.com' }

      before do
        FactoryBot.create(:user, email: email_attr_value)
      end

      it 'is invalid' do
        expect(user).not_to be_valid
        expect(user.errors[:email]).to include('has already been taken')
      end
    end
  end

  context 'username validations' do
    let(:user) { FactoryBot.build(:user, username: username_attr_value) }

    context 'with valid username' do
      let(:username_attr_value) { 'unique_username' }

      it 'is valid' do
        expect(user).to be_valid
      end
    end

    context 'with duplicate username' do
      let(:username_attr_value) { 'duplicate_username' }

      before do
        FactoryBot.create(:user, username: username_attr_value)
      end

      it 'is invalid' do
        expect(user).not_to be_valid
        expect(user.errors[:username]).to include('duplicate_username is already taken.')
      end
    end
  end

  context 'password validation' do
    let(:user) { FactoryBot.build(:user, password: password_attr_value) }

    context 'with valid password' do
      let(:password_attr_value) { 'Password1!' }
      it 'is valid' do
        expect(user).to be_valid
      end
    end

    context 'with invalid password (missing special character)' do
      let(:password_attr_value) { 'Password1' }

      it 'is invalid' do
        expect(user).not_to be_valid
      end
    end

    context 'with invalid password (too short)' do
      let(:password_attr_value) { 'P1!' }

      it 'is invalid' do
        expect(user).not_to be_valid
      end
    end

    context 'with invalid password (missing uppercase letter)' do
      let(:password_attr_value) { 'password1!' }

      it 'is invalid' do
        expect(user).not_to be_valid
      end
    end

    context 'with invalid password (missing digit)' do
      let(:password_attr_value) { 'Password!' }

      it 'is invalid' do
        expect(user).not_to be_valid
      end
    end
  end

  context 'associations' do
    it 'has many events' do
      association = described_class.reflect_on_association(:events)
      expect(association.macro).to eq(:has_many)
    end

    it 'has many comments' do
      association = described_class.reflect_on_association(:comments)
      expect(association.macro).to eq(:has_many)
    end

    it 'has many participants' do
      association = described_class.reflect_on_association(:participants)
      expect(association.macro).to eq(:has_many)
    end
  end
end
# rubocop:enable Metrics/BlockLength
