module Docs
  class SpringFramework < UrlScraper
    self.name = 'Spring Framework'
    self.slug = 'spring_framework'
    self.type = 'simple'
    self.release = '5.2.6.RELEASE'
    self.base_url = 'https://docs.spring.io/spring/docs/current/spring-framework-reference/'
    self.root_path = "index.html"
    self.links = {
      home: 'https://spring.io/',
      code: 'https://github.com/spring-projects/spring-framework'
    }

    html_filters.push 'spring_framework/entries', 'spring_framework/clean_html'
  
    options[:attribution] = <<-HTML
    Copyright &copy; 2002 - 2020 Pivotal, Inc. All Rights Reserved.
    HTML

    def get_latest_version(opts)
      doc = fetch_doc('https://docs.spring.io/spring/docs/current/spring-framework-reference/', opts)
      table = doc.at_css('#revnumber').inner_html
    end

  end
end
