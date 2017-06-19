require 'spec_helper'

RSpec.describe AfterShip::Connection do
  describe '#get' do
    it 'runs GET request' do
      expect(HTTP).to receive_message_chain(:headers, :get).and_return(double(body: "{}"))

      subject.get('/path', {})
    end
  end

  describe '#post' do
    it 'runs POST request' do
      expect(HTTP).to receive_message_chain(:headers, :post).and_return(double(body: "{}"))

      subject.post('/path', {})
    end
  end

  describe '#put' do
    it 'runs PUT request' do
      expect(HTTP).to receive_message_chain(:headers, :put).and_return(double(body: "{}"))

      subject.put('/path', {})
    end
  end

  describe '#delete' do
    it 'runs DELETE request' do
      expect(HTTP).to receive_message_chain(:headers, :delete).and_return(double(body: "{}"))

      subject.delete('/path', {})
    end
  end
end
