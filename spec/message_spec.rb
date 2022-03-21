require 'messages'

describe '#messages' do
  it 'returns a messages from the user' do
    user = User.create(username: 'test12', password: 'password12')

    messages = Messages.create(message: "Test Message", user_id: user.id)

    expect(messages.user_id).to eq user.id
    expect(messages.message).to eq "Test Message"
  end

end


# describe '.all' do
#   it 'returns all messages with username' do
#     user = User.create(username: 'test12', password: 'password12')

#     messages = Messages.create(message: "Test Message", user_id: user.id)

#     all = Messages.all

#     expect(messages.username).to eq 'test12'
#     expect(messages.message).to eq "Test Message"
#   end

# end