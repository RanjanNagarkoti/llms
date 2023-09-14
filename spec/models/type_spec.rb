require 'rails_helper'

RSpec.describe Type, type: :model do
  context 'validations' do
    let(:type) { FactoryBot.build(:type, name: attribute_value) }

    context 'with valid attributes' do
      let(:attribute_value) { 'Valid Type Name' }

      it 'is valid' do
        expect(type).to be_valid
      end
    end

    context 'with invalid attributes' do
      let(:attribute_value) { nil }

      it 'is invalid' do
        expect(type).not_to be_valid
      end

      it 'raises validation error when saved' do
        expect { type.save! }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

  context 'associations' do
    it 'has many events' do
      association = described_class.reflect_on_association(:events)
      expect(association.macro).to eq(:has_many)
    end
  end
end
