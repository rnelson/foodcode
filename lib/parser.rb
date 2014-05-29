require 'nokogiri'
require 'open-uri'
require 'colorize'

class FoodCodeParser
  def self.parse(xml_filename, outdir)
    xml = Nokogiri::XML.parse(File.read(xml_filename))
    pages = xml.css('page').to_a

    page_number = 1
    pages.each {|page|
      puts "Proccessing page #{page_number}...".green
      page_text = ''

      page.css('text').each {|text|
        next unless text.children.count > 0
        page_text += text.content
      }

      File.open(outdir + '/' + page_number.to_s + '.json', 'w+') {|f|
        f.puts(page_text)
      }
      page_number += 1
    }
  end
end

