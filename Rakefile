PDFURL = 'http://www.fda.gov/downloads/Food/GuidanceRegulation/RetailFoodProtection/FoodCode/UCM374510.pdf'
OUTDIR = 'data/'
PDFFILE = OUTDIR + 'UCM374510.pdf'
XMLFILE = PDFFILE.pathmap('%X') + '.xml'

task :default do
  if not FileTest.exists?(XMLFILE)
    Rake::Task["xml"].invoke
  end

  require './lib/parser'
  FoodCodeParser.parse XMLFILE, OUTDIR
end

task :xml => [:pdf] do
  system "pdftohtml -c -i -noframes -xml #{PDFFILE} #{XMLFILE}"
end

task :pdf => [:data_dir] do
  system "wget -O #{PDFFILE} #{PDFURL}"
end

task :data_dir => [:clean] do
  system "mkdir -p #{OUTDIR}"
end

task :clean do
  system "rm -r #{OUTDIR}"
end