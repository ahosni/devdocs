module Docs
  class Thymeleaf
    class CleanHtmlFilter < Filter
      def call

        # remove menu and thymeleaf logo
        at_css('#site-menu').remove unless at_css('#site-menu').nil?
        at_css('.toolbar-menu').remove unless at_css('.toolbar-menu').nil?
        at_css('.hero-header-image').remove unless at_css('.hero-header-image').nil?
        
        css('pre').each do |node|
          node['data-language'] = node.classes[0]
        end
      
        doc
      end
    end
  end
end
