module NmrSim
  class NmrSimulation < ActiveRecord::Base
    acts_as_paranoid
    attr_accessor :molfile
    belongs_to :molecule, class_name: "Molecule"

    before_validation :retrieve_1h, :retrieve_13c

    def result
      { response_1h: response_1h, response_13c: response_13c }
    end

    private
      def retrieve_1h
        self.response_1h = nmrdb[:response_1h] unless response_1h
      end

      def retrieve_13c
        self.response_13c = nmrdb[:response_13c] unless response_13c
      end

      def nmrdb
        @nmrdb ||= Simulation::Nmrdb.new(molfile: molfile).fetch
      end
  end
end
