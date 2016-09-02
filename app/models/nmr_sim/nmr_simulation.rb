module NmrSim
  class NmrSimulation < ActiveRecord::Base
    acts_as_paranoid
    attr_accessor :molfile
    belongs_to :molecule, class_name: "Molecule"

    before_validation :retrieve_spectrum

    private
      def retrieve_spectrum
        self.response_1h = nmrdb[:response_1h]
        self.response_13c = nmrdb[:response_13c]
      end

      def nmrdb
        @nmrdb ||= Simulation::Nmrdb.new(molfile: self.molfile).fetch
      end
  end
end
