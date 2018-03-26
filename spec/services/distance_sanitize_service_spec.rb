describe DistanceSanitizeService do
  context '#call' do
    context 'when all data is okay' do
      let(:params_sanitized) { { origin: 'A', destination: 'B', gap: '10' } }
      subject { described_class.call('a B 10') }

      it { is_expected.to include params_sanitized }
    end

    context 'put origin and destination on right order' do
      subject { described_class.call('b A 10') }
      let(:params_sanitized) { { origin: 'A', destination: 'B', gap: '10' } }

      it { is_expected.to match params_sanitized }
    end
  end
end
