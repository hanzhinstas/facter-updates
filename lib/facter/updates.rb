Facter.add(:updates) do
  setcode do
    if Facter.value(:lsbdistid) == "Ubuntu"
      if File.exists?('/var/lib/update-notifier/updates-available')
        updates = 0
        update_file = File.open('/var/lib/update-notifier/updates-available')
        update_file.each_line do |line|
          if line.split("\n").grep(/packages can be updated/)
            updates = line.split(" ")[0]
          end
        end
        updates
      end
    end
  end
end

Facter.add(:updates_security) do
  setcode do
    if Facter.value(:lsbdistid) == "Ubuntu"
      if File.exists?('/var/lib/update-notifier/updates-available')
        updates_security = 0
        update_file = File.open('/var/lib/update-notifier/updates-available')
        update_file.each_line do |line|
          if line.split("\n").grep(/updates are security updates/)
            updates_security = line.split(" ")[0]
          end
        end
        updates_security
      end
    end
  end
end
