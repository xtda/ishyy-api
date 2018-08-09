module StreamElements
  class StreamElements
    include ActiveModel::Model
    include StreamElementsWrapper

    def parse_name(name)
      name.delete('@').downcase
    end

    def humanize(seconds)
      [[60, :seconds], [60, :minutes], [24, :hours], [1000, :days]].map do |count, name|
        if seconds.positive?
          seconds, n = seconds.divmod(count)
          "#{n.to_i} #{name}"
        end
      end.compact.reverse.join(' ')
    end
  end
end
