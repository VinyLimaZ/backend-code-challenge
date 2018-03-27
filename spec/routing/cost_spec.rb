describe 'Cost route' do
  it 'is a valid route' do
    expect(get: '/cost').to route_to('cost#show')
  end
end
