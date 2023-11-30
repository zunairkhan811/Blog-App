require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  before { subject.save }
  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'Photo should be present' do
    subject.photo = nil
    expect(subject).to_not be_valid
  end
  it 'Bio should be present' do
    subject.bio = nil
    expect(subject).to_not be_valid
  end
  it 'Post Counter should be zero' do
    expect(subject.posts_counter).to eq(0)
  end
end
