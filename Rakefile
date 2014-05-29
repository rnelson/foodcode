task :default do
  require './lib/parser'
  file = 'data/UCM374510.xml'
  outdir = 'data/'
  FoodCodeParser.parse file, outdir
end

task :xml => [:pdf] do
  file = 'data/UCM374510.pdf'
  system "pdftohtml -c -i -noframes -xml #{file} #{file.pathmap('%X')}"
end

task :pdf => [:data_dir] do
  file = 'data/UCM374510.pdf'
  url = 'http://www.fda.gov/downloads/Food/GuidanceRegulation/RetailFoodProtection/FoodCode/UCM374510.pdf'
  system "wget -O #{file} #{url}"
end

task :data_dir => [:clean] do
  system "mkdir -p data"
end

task :clean do
  system "rm -r data"
end