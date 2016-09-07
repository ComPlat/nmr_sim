module NmrSim
  class NmrSimulation < ActiveRecord::Base
    acts_as_paranoid
    attr_accessor :molfile
    belongs_to :molecule, class_name: "Molecule"

    before_validation :grasp_1h, :grasp_13c

    def result
      { response_1h: read(path_1h), response_13c: read(path_13c) }
    end

    private
      def grasp_1h
        if !path_1h && data[:response_1h]
          self.path_1h = compose_and_save("1h", data[:response_1h])
        end
      end

      def grasp_13c
        if !path_13c && data[:response_13c]
          self.path_13c = compose_and_save("13c", data[:response_13c])
        end
      end

      def data
        send(source)
      end

      def nmrdb
        @nmrdb ||= Simulation::Nmrdb.new(molfile: molfile).fetch
      end

      def compose_and_save(type, json)
        file_name = generate_filename(type)
        File.open(file_path + "/" + file_name, 'w') { |file| file.write(json) }
        file_name
      end

      def generate_filename(type)
        filenames = { source: source, type: type, molfile: molecule.molfile, time: Time.current }
        key_base = "#{filenames.to_a.flatten.join}"
        Digest::SHA256.hexdigest(key_base) + '.json'
      end

      def file_path
        File.join(Rails.root, 'public', 'simulations', "#{source}")
      end

      def read(file_name)
        file_name ? File.open(file_path + "/" + file_name) : nil
      end
  end
end
