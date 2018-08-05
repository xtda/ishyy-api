class AddRefToAuditlog < ActiveRecord::Migration[5.2]
  def change
    add_column :auditlogs, :ref, :string
  end
end
