describe 'Distance route' do
  it 'is a valid route' do
    expect(post: "/distance").to route_to("distance#create")
  end
end
