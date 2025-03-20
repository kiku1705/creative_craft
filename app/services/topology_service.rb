class TopologyService
  def initialize(network, opt = {})
    @network = network
    @options = opt
  end

  def lldp_summary
      devices  = @network.devices.where("lower(label) LIKE lower(%?%)", @options[:search])
  end
end