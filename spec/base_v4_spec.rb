require 'spec_helper'

describe AfterShip::V4::Base do
  let(:http_verb_method) { :get }
  let(:end_point)        { 'trackings' }
  let(:query)           { { courier: 'usps' } }
  let(:body)             { { emails: ['me@example.com'] } }
  subject                { described_class.new(http_verb_method, end_point, query, body) }

  its(:body)             { should(eq(body)) }
  its(:query)           { should(eq(query)) }
  its(:end_point)        { should(eq(end_point)) }
  its(:http_verb_method) { should(eq(http_verb_method)) }

  describe ".call" do
    let(:body)     { { emails: '', smses: '' } }
    let(:response) { double(raw_body: '{}') }
    let(:request)  { double }
    before         {
		#HTTPI.logger.stub(:warn)
	}

    it 'validates' do
      #HTTPI.logger.should_receive(:warn).with("the emails field should be an array").once
      #HTTPI.logger.should_receive(:warn).with('the smses field should be an array').once

      # HTTPI.should_receive(:send).with(:get, kind_of(HTTPI::Request)).and_return(response)
      subject.call
    end

    it 'create valid request' do
      #HTTPI::Request.should_receive(:new).with("https://api.aftership.com/v4/trackings?courier=usps").and_return(request)
      #request.should_receive(:headers=).with({"aftership-api-key"=>nil, "Content-Type"=>"application/json"}).once.and_return(request)
      #request.should_receive(:body=).with("{\"emails\":\"\",\"smses\":\"\"}").once.and_return(request)
      #HTTPI.should_receive(:send).with(:get, request).and_return(response)

      subject.call
    end
  end
end
