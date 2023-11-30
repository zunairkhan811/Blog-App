require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  subject { Post.create(author: user, title: 'Journey to the moon', text: 'Hi Tom!') }
  before { subject.save }
  it 'User should be present' do
    subject.author = nil
    expect(subject).to_not be_valid
  end
  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end
  it 'title should have max 250 character' do
    subject.title = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.
    Nam quam tellus, suscipit ut semper consectetur, convallis ut sapien.
    Suspendisse a mi non nisi accumsan tempus.
    Duis mollis et lacus a convallis.
    Maecenas pulvinar augue massa.
    Maecenas pretium leo id dolor rutrum, tempus venenatis leo tincidunt.'
    expect(subject).to_not be_valid
  end
  it 'Text should be present' do
    subject.text = nil
    expect(subject).to_not be_valid
  end
  it 'Posts_counter should be One' do
    expect(user.posts_counter).to eq(1)
  end
end
