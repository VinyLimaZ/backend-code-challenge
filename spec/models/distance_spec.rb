describe Distance do
  context '::validates' do
    %w[origin destination].each do |attr|
      it { is_expected.to validate_presence_of(attr) }
      # TODO arrumar essas verificaçoes que estão recebendo erro de outras
      # validações
      xit { is_expected.to validate_inclusion_of(attr).in_array(('a'..'z').to_a) }
      xit { is_expected.to validate_length_of(attr).is_equal_to(1) }
    end
    xit { is_expected.to validates_presence_of('gap')}
    xit { is_expected.to validate_inclusion_of('gap').in_range(0..100_000) }
  end

  context '#find_or_initialize_by' do
    let(:distance) { create(:distance, origin: 'A', destination: 'B', gap: 10) }
    let(:distance_params) { { origin: 'A', destination: 'B', gap: 10 } }

    context 'if find somenthing' do
      subject { described_class.find_or_initialize_by('a b 10') }
      it 'return a distance object from database' do
        expect(subject).not_to be_a_new(Distance).with(distance_params)
      end
    end

    context 'update gap attribute' do
      let(:distance_params) { { origin: 'A', destination: 'B', gap: 20 } }

      subject { described_class.find_or_initialize_by('a b 20') }

      it 'update gap attribute' do
        subject.save
        expect(subject).to have_attributes(distance_params)
      end
    end

    context '::initialize' do
      context 'if didnt find anything' do
        let(:distance_params) { { origin: 'A', destination: 'Z', gap: 100 } }
        subject { described_class.find_or_initialize_by('a z 100') }
        it { is_expected.to be_a_new(Distance).with(distance_params) }
      end
    end
  end
end
