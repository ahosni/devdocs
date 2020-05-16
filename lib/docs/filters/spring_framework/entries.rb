module Docs
  class SpringFramework
    class EntriesFilter < Docs::EntriesFilter
    
      def get_type
        if slug.start_with?('overview')
          'Overview'
        elsif slug.start_with?('core')
          'Core'
        elsif slug.start_with?('testing')
          'Testing'
        elsif slug.start_with?('data-access')
          'Data Access'
        elsif slug.start_with?('web-reactive')
          'Web'
        elsif slug.start_with?('web')
          'Web Reactive'
        elsif slug.start_with?('integration')
          'Integration'
        elsif slug.start_with?('languages')
          'Languages'
        end
      end

      def additional_entries
        css('td a[href], li a[href]').each_with_object [] do |node, entries|
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
