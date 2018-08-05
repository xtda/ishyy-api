class Auditlog < ApplicationRecord
  def self.log(name, method, log)
    Auditlog.create(type: self.type, name: name, method: method, log: log)
  end
end
