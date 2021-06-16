class API < Grape::API
  mount NmrSim::NmrdbAPI
end
