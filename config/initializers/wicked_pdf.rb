WickedPdf.config = {
  # wkhtmltopdf script will automatically determine the correct verson of the binary to use: It Just Works TM
  exe_path: "#{ENV['GEM_HOME']}/gems/wkhtmltopdf-binary-#{Gem.loaded_specs['wkhtmltopdf-binary'].version}/bin/wkhtmltopdf" }