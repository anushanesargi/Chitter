require 'messages'

describe '#messages' do
  it 'returns a messages from the user' do
    t = Time.now
    user = User.create(username: 'test12', password: 'password12')

    messages = Messages.create(message: "Test Message", user_id: user.id, date: t.strftime("%Y-%m-%d") , time: t.strftime("%H:%M"))

    expect(messages.user_id).to eq user.id
    expect(messages.message).to eq "Test Message"
  end

end


describe '.all' do
  it 'returns all messages with username' do
    t = Time.now
    user = User.create(username: 'test12', password: 'password12')

    Messages.create(message: "Test Message", user_id: user.id, date: t.strftime("%Y-%m-%d") , time: t.strftime("%H:%M"))
    Messages.create(message: "Hello", user_id: user.id, date: t.strftime("%Y-%m-%d") , time: t.strftime("%H:%M"))


    all = Messages.all
    p all

    p all[1]['date']
    expect(all[1]['username']).to eq 'test12'
    expect(all[1]['message']).to eq "Test Message"
  end

end
