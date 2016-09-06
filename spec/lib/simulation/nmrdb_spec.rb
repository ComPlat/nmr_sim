require "spec_helper"

describe Simulation::Nmrdb do
  let(:path) { File.join(File.dirname(__FILE__), "../..", "/fixtures/benzene_molfile.rb") }
  let(:molfile) { File.read(path) }

  describe "#fetch" do
    context "success" do
      before do
        stub_request(:post, 'https://script.epfl.ch/script/Service/20160510/vDpGux3hsy').
          with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
          to_return(status: 200, body: '{"spinus": "spinus"}', headers: {})
        stub_request(:post, 'https://script.epfl.ch/script/Service/20140827/6klsXZb3NS').
          with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
          to_return(status: 200, body: '{"resultLog":"finished OK"}', headers: {})
      end

      it "return a hash with response" do
        result = Simulation::Nmrdb.new(molfile: molfile).fetch
        expect(result.class).to eq(Hash)
        expect(result[:response_1h]).to eq('{"spinus": "spinus"}')
        expect(result[:response_13c]).to eq('{"resultLog":"finished OK"}')
      end
    end

    context "fail" do
      before do
        stub_request(:post, 'https://script.epfl.ch/script/Service/20160510/vDpGux3hsy').
          with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
          to_return(status: 403, body: "stubbed response", headers: {})
        stub_request(:post, 'https://script.epfl.ch/script/Service/20140827/6klsXZb3NS').
          with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
          to_return(status: 403, body: "stubbed response", headers: {})
      end

      it "return nil" do
        result = Simulation::Nmrdb.new(molfile: molfile).fetch
        expect(result.class).to eq(Hash)
        expect(result[:response_1h]).to eq(nil)
        expect(result[:response_13c]).to eq(nil)
      end
    end
  end
end
