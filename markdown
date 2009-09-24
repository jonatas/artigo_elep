#!/opt/local/bin/ruby1.8.7
require 'rubygems'
require 'redcloth'
require 'coderay'
require 'redclothcoderay'

Template = %{
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

file = ARGV.shift
begin
  $stdout.puts(Template % [
                 file.gsub(/\.markdown$/,''), 
                 RedCloth::new(IO.read(file)).to_html( :markdown, :ruby)
               ])
rescue
	$stderr.puts "Abortando: Erro Fatal: %s \n %s", $!,$@
	exit 255
end
