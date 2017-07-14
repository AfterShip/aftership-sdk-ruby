require 'spec_helper'

RSpec.describe AfterShip::V4::Tracking do
  describe '#create' do
    it 'runs POST /trackings request' do
      expect_any_instance_of(AfterShip::Connection).to receive(:post).with('trackings', tracking: { tracking_number: '123' })

      described_class.create('123')
    end

    it 'passes optional params' do
      expect_any_instance_of(AfterShip::Connection).to receive(:post).with('trackings', tracking: { foo: :bar, tracking_number: '123' })

      described_class.create('123', foo: :bar)
    end
  end

  describe '#retrack' do
    it 'runs retrack request' do
      expect_any_instance_of(AfterShip::Connection).to receive(:post).with('trackings/asd/123/retrack', {})

      described_class.retrack('asd', '123')
    end
  end

  describe '#delete' do
    it 'runs delete request' do
      expect_any_instance_of(AfterShip::Connection).to receive(:delete).with('trackings/asd/123', {})

      described_class.delete('asd', '123')
    end
  end

  describe '#delete_by_id' do
    it 'runs delete request' do
      expect_any_instance_of(AfterShip::Connection).to receive(:delete).with('trackings/123-456-789', {})

      described_class.delete_by_id('123-456-789')
    end
  end

  describe '#get' do
    it 'runs get request' do
      expect_any_instance_of(AfterShip::Connection).to receive(:get).with('trackings/asd/123', {})

      described_class.get('asd', '123')
    end
  end

  describe '#find' do
    it 'runs get request' do
      expect_any_instance_of(AfterShip::Connection).to receive(:get).with('trackings/123-456-789', {})

      described_class.find('123-456-789')
    end
  end

  describe '#all' do
    it 'runs trackings request' do
      expect_any_instance_of(AfterShip::Connection).to receive(:get).with('trackings', {})

      described_class.all
    end
  end
end
