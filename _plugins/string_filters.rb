module Jekyll
  module StringFilters
    def month_space_year(input)
      # Capitalize first letter, add space before 4-digit year
      input.to_s.sub(/([a-zA-Z]+)(\d{4})/, '\1 \2').capitalize
    end
  end
end

Liquid::Template.register_filter(Jekyll::StringFilters)