class CompressCssFilterExtension < Radiant::Extension
  version "1.0"
  description "A filter to compress css."
  url "http://code.trike.com.au/radiant/filters/compress_css_filter"
  
  def activate
    CompressCssFilter
  end
  
end
