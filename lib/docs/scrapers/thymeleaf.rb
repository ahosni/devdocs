module Docs
  class Thymeleaf < UrlScraper
    self.type = 'simple'
    self.release = '3.0.11.RELEASE'
    self.base_url = 'https://www.thymeleaf.org/'
    self.root_path = 'documentation.html'
    self.links = {
      home: 'https://www.thymeleaf.org/',
      code: 'https://github.com/thymeleaf'
    }

    html_filters.push 'thymeleaf/entries', 'thymeleaf/clean_html'

    options[:only_patterns] = [
      /\/3\.0\/usingthymeleaf.html/,
      /\/3\.0\/thymeleafspring.html/,
      /\/3\.0\/extendingthymeleaf.html/
    ]

    options[:skip_patterns] = [/\Awhoisusingthymeleaf.html\// ]
  
    options[:attribution] = <<-HTML
    Copyright &copy; The Thymeleaf Team.<br>
      Thymeleaf is open source software distributed under the Apache License 2.0
    HTML

    def get_latest_version(opts)
      doc = fetch_doc('https://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf.html', opts)
      table = doc.at_css('#project-version').inner_text.gsub('Project version: ','').strip
    end

  end
end
