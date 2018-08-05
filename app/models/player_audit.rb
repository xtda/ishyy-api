class PlayerAudit < Auditlog
  def self.log(name, method, log)
    PlayerAudit.create(name: name, method: method, log: log)
  end
end
