#!/opt/local/bin/ruby1.8.7
require 'rubygems'
require 'redcloth'
require 'coderay'
require 'redclothcoderay'



DocumentWrapper = %{
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xml:lang="en-US" lang="en-US" xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
  <head>
  <title>%s</title>
  <link href="Article.css" media="all" rel="Stylesheet" type="text/css" />
  <link href="coderay.css" media="all" rel="Stylesheet" type="text/css" />
  </head>
  <body>
  %s
  </body>
</html>
}

def main
	fragment = false
	destination = '.'

	# Filter mode if no arguments
	ARGV.push( "-" ) if ARGV.empty?

	ARGV.each {|file|
		if file == '-'
			contents = $stdin.readlines(nil)
		else
			contents = File::readlines( file, nil )
		end

		bc = RedCloth::new( contents.join )

		if fragment
			$stdout.puts bc.to_html :markdown, :ruby
		else
			$stdout.puts DocumentWrapper % [ file.gsub(/\.markdown$/,''), bc.to_html( :markdown, :ruby) ]
		end
	}

rescue => err
	$stderr.puts "Aborting: Fatal error: %s" % err.message
	exit 255
end



main

