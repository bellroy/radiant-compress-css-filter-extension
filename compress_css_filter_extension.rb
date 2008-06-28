class CompressCssFilterExtension < Radiant::Extension
  version "1.0"
  description "A filter to compress css."
  url "http://github.com/tricycle/radiant-compress-css-filter-extension/"
  
  def activate
    CompressCssFilter
  end
  
end
