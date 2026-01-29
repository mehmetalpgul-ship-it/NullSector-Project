# NullSector - Ruby Reconnaissance Module
# Operator: GhostByte
# Mission: Network & System Scanning

require 'json'
require 'socket'

class SectorRecon
  def initialize(target_ip)
    @target_ip = target_ip
    @start_time = Time.now
  end

  def scan_local_network
    puts "[*] NullSector Ruby-Engine Active."
    puts "[!] Scanning sectors for origin: #{@target_ip}"
    
    # Yerel makine bilgilerini topla
    hostname = Socket.gethostname
    local_ip = Socket.ip_address_list.find { |ai| ai.ipv4? && !ai.ipv4_loopback? }.ip_address
    
    recon_data = {
      operator: "GhostByte",
      hostname: hostname,
      local_ip: local_ip,
      scan_date: @start_time.strftime("%Y-%m-%d %H:%M:%S")
    }

    # Sonuçları mühürle
    File.open("recon_results.json", "w") do |f|
      f.write(JSON.pretty_generate(recon_data))
    end

    puts "[+] Recon complete. Data stored in recon_results.json"
  end
end

# Operasyonu başlat
recon = SectorRecon.new("85.111.76.66")
recon.scan_local_network
