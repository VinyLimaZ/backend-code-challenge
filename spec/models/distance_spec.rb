describe Distance do
  context '::validates' do
    %w(origin destinatarie distance).each do |attr|
      it { is_expected.to validate_presence_of(attr) }
    end
  end
  context '#find_or_initialize_by' do
    context '::find' do
      let(:distance) { create(:distance) }
      subject { described_class.find_or_initialize_by(distance_params) }
      it 'return a distance object from database' do
        expect(subject).to eq distance
      end

      let(:distance_params) do
        distance_params = distance.dup.attributes
        distance_params['distance'] = rand(0..100_000)
      end

      it 'update distance attribute' do
        subject.save
        expect(subject.attributes).to match(distance_params)
      end
    end
    context '::initialize' do
      let(:distance) { build(:distance) }
      subject { described_class.find_or_initialize_by(distance.attributes)}

      it 'if didnt find a object, initialize one' do
        expect(subject).to be_a_new(Distance).with(distance.attributes)
      end
    end
  end
end
