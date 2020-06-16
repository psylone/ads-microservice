RSpec.describe Ads::UpdateService do
  subject { described_class }

  let(:lat) { 45.05 }
  let(:lon) { 90.05 }

  context 'missing ad' do
    it 'adds an error' do
      result = subject.call(-1, lat: lat, lon: lon)

      expect(result).to be_failure
      expect(result.errors).to include('Объявление не найдено')
    end
  end

  context 'missing data' do
    let(:ad) { create(:ad) }

    it 'updates fields to nil values' do
      result = subject.call(ad.id, {})
      ad.reload

      expect(result).to be_success
      expect(ad.lat).to be_nil
      expect(ad.lon).to be_nil
    end
  end

  context 'existing data' do
    let(:ad) { create(:ad, city: 'City') }

    it 'updates an ad' do
      result = subject.call(ad.id, lat: lat, lon: lon)
      ad.reload

      expect(result).to be_success
      expect(ad.lat).to eq(lat)
      expect(ad.lon).to eq(lon)
    end

    it 'assigns ad' do
      result = subject.call(ad.id, lat: lat, lon: lon)

      expect(result.ad).to be_kind_of(Ad)
    end
  end
end
