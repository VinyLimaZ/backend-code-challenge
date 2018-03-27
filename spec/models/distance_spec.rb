describe Distance do
  context '::validates' do
    %w[origin destination].each do |attr|
      it { is_expected.to validate_presence_of(attr) }
    end
  end

  context '#find_or_initialize_by' do
    let!(:distance) { create(:distance, origin: 'A', destination: 'B', gap: 10) }
    let(:distance_params) do
      { origin: 'A', destination: 'B', gap: 10 }.with_indifferent_access
    end

    context 'if find somenthing' do
      subject { described_class.find_or_initialize_by(distance_params) }
      it 'return a Distance object from database' do
        expect(subject).not_to be_a_new(Distance).with(distance_params)
      end
    end

    context 'update gap attribute' do
      let(:distance_params) do
        { origin: 'A', destination: 'B', gap: 20 }.with_indifferent_access
      end

      subject { described_class.find_or_initialize_by(distance_params) }

      it 'update gap attribute' do
        subject.save
        expect(subject).to have_attributes(distance_params)
      end
    end

    context '::initialize' do
      context 'if didnt find anything' do
        let(:distance_params) do
          { origin: 'A', destination: 'Z', gap: 100 }.with_indifferent_access
        end
        subject { described_class.find_or_initialize_by(distance_params) }
        it { is_expected.to be_a_new(Distance).with(distance_params) }
      end
    end
  end
end
