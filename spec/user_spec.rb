require 'user'

describe '.create' do
  it 'creates a new user' do
    user = User.create(username: 'test123', password: 'password12')

    expect(user).to be_a User
    expect(user.username).to eq 'test123'
  end
end