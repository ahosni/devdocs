module Docs
  class Thymeleaf
    class EntriesFilter < Docs::EntriesFilter

      def get_type
        if slug.end_with?('usingthymeleaf')
          'Using Thymeleaf'
        elsif slug.end_with?('thymeleafspring')
          'Thymeleaf Spring'
        elsif slug.end_with?('extendingthymeleaf')
          'Extending Thymeleaf'
        end
      end
 
      def additional_entries
        css('ul a[href]').each_with_object [] do |node, entries|
          next if root_page?
          next if node['href'].start_with?('http')
          name = node.content.strip
          id = node['href'].remove('#')
          next if id.blank?
          entries << [name, id, get_type]
        end
      end
    end
  end
end
