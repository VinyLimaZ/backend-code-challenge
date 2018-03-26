describe CostService do
  context '#call' do
    context 'find the ' do
      let(:route_a_b) do
        create(:distance, origin: 'A', destination: 'B', distance: 10)
      end
      let(:route_b_c) do
        create(:distance, origin: 'B', destination: 'C', distance: '15')
      end
      let(:route_a_c) do
        create(:distance, origin: 'A', destination: 'C', distance: 30)
      end
      let(:cost_params){ {origin: 'A', destination: 'C', weight: 5 } }
      let(:cost_result){ {route: 'A-B-C', value: 18.75}}
      subject{ described_class.call(cost_params) }

      it 'find A-B-C as smaller route from A to C' do
        expect(subject).to eq cost_result
      end
    end
  end
end
