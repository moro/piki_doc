
module PikiDoc
  Version = "0.0.2.2"

  autoload "Document", "piki_doc/document"
  def register(*plugins); PikiDoc::Document.register(*plugins); end
  def to_html(src, options={}); PikiDoc::Document.to_html(src, options) ; end
  def to_xhtml(src, options={}); PikiDoc::Document.to_xhtml(src, options) ; end
  module_function :register, :to_html, :to_xhtml
end

