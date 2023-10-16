require 'rails_helper'

RSpec.describe Coupon, type: :model do
  it 'should set the created_at timestamp when created' do
    coupon = FactoryBot.create(:coupon)
    expect(coupon.created_at).to_not be_nil
  end

  it 'should set the updated_at timestamp when updated' do
    coupon = FactoryBot.create(:coupon)
    coupon.name = 'test'
    coupon.save
    expect(coupon.updated_at).to_not be_nil
    expect(coupon.created_at).to_not eq(coupon.updated_at)
  end
  
  describe 'Associations' do
    debugger
    it { should have_many(:products).dependent(:destroy) }
  end

  describe 'Validations' do
    it 'should be valid with factory defaults' do
      coupon = FactoryBot.build(:coupon)
      expect(coupon).to be_valid
    end

    it 'should be invalid without a name' do
      coupon = FactoryBot.build(:coupon, name: nil)
      expect(coupon).to_not be_valid
      expect(coupon.errors.full_messages.size).to eq(1)
    end

    it 'should be invalid with a blank name' do
      coupon = FactoryBot.build(:coupon, name: '')
      expect(coupon).to_not be_valid
      expect(coupon.errors.full_messages.size).to eq(1)
    end

    it 'should be invalid without a value' do
      coupon = FactoryBot.build(:coupon, value: nil)
      expect(coupon).to_not be_valid
      expect(coupon.errors.full_messages.size).to eq(2)
    end

    it 'should be invalid with a blank value' do
      coupon = FactoryBot.build(:coupon, value: '')
      expect(coupon).to_not be_valid
      expect(coupon.errors.full_messages.size).to eq(2)
    end

    it 'should be valid with an integer value' do
      coupon = FactoryBot.build(:coupon, value: 100)
      expect(coupon).to be_valid
    end

    it 'should be invalid with a non-integer value' do
      coupon = FactoryBot.build(:coupon, value: 'hundred')
      expect(coupon).to_not be_valid
      expect(coupon.errors.full_messages.size).to eq(1)
    end
  end
end
