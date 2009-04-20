module PikiDoc
  module ImageUriAutolinkFix
    private
    def compile_uri_autolink(uri)
      if(image?(path = URI(uri).path))
        @output.image_hyperlink(uri, path.split(/\//).last)
      else
        super
      end
    end
  end
end
