module StreamElements
  class Tax < StreamElements
    def initialize(caller, amount)
      @caller = StreamElementsWrapper::Points.new(parse_name(caller))
      @caller_points = @caller.points
      @amount = parse_amount(amount)
      @mayor = Mayor.first
    end

    def pay_tax
      current_tax = (@mayor.current_tax.to_f / 100)
      total_taxed = (@amount * current_tax).to_i
      @caller.take_points(total_taxed)
      @mayor.current_funds += total_taxed
      if @mayor.save
        message = "You have been taxed #{total_taxed} potatoes (Tax rate: #{@mayor.current_tax}%) #{@caller.name}"
        StreamElementsWrapper::Bot.new.message(message)
        PlayerAudit.log(@caller.name, 'TAX', "Paid #{total_taxed} in taxes")
        message
      end
    end

    def parse_amount(amount)
      return @caller_points if amount.eql?('all')
      return amount.to_i * 1000 if amount[-1].casecmp?('k')
      return amount.to_i * 1_000_000 if amount[-1].casecmp?('m')
      amount.to_i
    end
  end
end
