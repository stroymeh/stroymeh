require 'rails_helper'

describe Page do
  describe "validations" do
    subject { FactoryGirl.build(:page) }

    it { should validate_presence_of(:title) }
    it { should be_valid }
  end
end
