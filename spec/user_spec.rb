require 'user'

describe '.create' do
  it 'creates a new user' do
    user = User.create(username: 'test123', password: 'password12')

    expect(user).to be_a User
    expect(user.username).to eq 'test123'
  end
end

describe '.find' do
  it 'finds a user by ID' do
    user = User.create(username: 'test123', password: 'password12')
    result = User.find(user.id)

    expect(result.id).to eq user.id
    expect(result.username).to eq user.username
  end
end