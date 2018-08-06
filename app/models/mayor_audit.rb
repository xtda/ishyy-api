class MayorAudit < Auditlog
  def self.log(name, method, ref, log)
    MayorAudit.create(name: name, method: method, ref: ref, log: log)
  end
end
