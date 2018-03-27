describe CostService do
  context '#call' do
    context 'find the much cheapest value' do
      let!(:route_a_b) do
        create(:distance, origin: 'A', destination: 'B', gap: 10)
      end
      let!(:route_b_c) do
        create(:distance, origin: 'B', destination: 'C', gap: '15')
      end
      let!(:route_a_c) do
        create(:distance, origin: 'A', destination: 'C', gap: 30)
      end

      let(:cost) { Cost.new(origin: 'A', destination: 'C', weight: 5) }
      let(:cost_result) { 18.75 }
      subject { described_class.call(cost) }

      it 'find A-B-C as smaller route from A to C' do
        expect(subject).to eq cost_result
      end
    end
  end
end
