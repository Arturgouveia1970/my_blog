require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    User.new(name: "Anything", photo: 'http://twitter.com', bio: 'test for User')
  }

  describe "Tests for validations" do
    it "is not valid" do
      expect(subject).to_not be_valid
    end

    it "is not valid without a title" do
      subject.posts_counter = 0
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
end
