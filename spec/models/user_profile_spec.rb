require 'rails_helper'

RSpec.describe UserProfile, type: :model do
  subject { UserProfile.new(name: '名前') }
  it { expect(subject.name).to eq('名前') }
end
