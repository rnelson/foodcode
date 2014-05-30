Food Code Parser
================
This project parses the [FDA Food Code](http://www.fda.gov/Food/GuidanceRegulation/RetailFoodProtection/FoodCode/ucm374275.htm) 
and converts it into plain text and JSON for easier use.

Currently, it doesn't do anything beyond simply pulling the text out of each page and save it to flat files by page 
number. Better parsing may be done in the future; contributions welcome!

Requirements
------------
1. Ruby (tested against 2.1.2, but 1.9+ should work)
2. Bundler (`gem install bundler`)
3. Rake (`gem install rake`)
4. pdftohtml

On OS X, use [Homebrew](http://brew.sh) to install pdftohtml. The pdftohtml package doesn't work with the 2013 food code 
document, so install [Poppler](http://poppler.freedesktop.org) instead: `brew install poppler`.

On Debian-based Linux distros, the `pdftohtml` package works fine: `apt-get install pdftohtml`.

Usage
-----
Before your first use, you'll need to make sure you have the necessary gems installed. From the directory the code is 
in, run `bundle install`. (If you aren't using [RVM](http://rvm.io) or something similar, you may need to run bundler 
as root/through sudo.)

Once the gems are installed, simply run `rake` to download the 2013 PDF, convert it into an XML document, and generate 
the flat files separated by page.