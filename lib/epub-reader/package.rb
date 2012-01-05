module Epub
  class Package

    def initialize(rootfile, file)
      @rootfile = rootfile
      @package  = get_package_content(file)
      @xml = Nokogiri::XML(@package)
      @xml.remove_namespaces!
    end

    def raw
      @package.to_s
    end

    def path
      @rootfile.attr('full-path')
    end

    def mediatype
      @rootfile.attr('media-type')
    end

    def version
      root.attr('version').to_s.to_i
    end

    def identifier
      identifiers.css("[id=#{unique_identifier}]").text
    end

    # TODO: identify language
    # TODO: identify subtitles
    def title
      titles.first.text
    end

    def language
      languages.first.text
    end

    # TODO: identify role
    # TODO: identify file-as
    # TODO: identify alternate-script
    # TODO: identify display-seq
    def creator
      creators.size > 0 ? creators.first.text : ""
    end

    # TODO: creator copy
    def contributor
      contributors.size > 0 ? contributors.first.text : ""
    end

    def date
      d = metadata.css('data')
      d.size > 0 ? d.text : ""
    end

    def source
      s = metadata.css('source')
      s.size > 0 ? s.text : ""
    end

    def type
      t = metadata.css('type')
      t.size > 0 ? t.text : ""
    end

    # TODO: to do parse of
    # metadata [required]
    # manifest [required]
    # spine    [required]
    # guide    [optional/deprecated]
    # bindings [optional]

    private

    def get_package_content(file)
      begin
        file.get_input_stream(path)
      rescue
        nil
      end
    end

    def root
      @xml.css('package')
    end

    def unique_identifier
      root.attr('unique-identifier').to_s
    end

    def prefix
      root.attr('prefix').to_s
    end

    def lang
      root.attr('xml:lang').to_s
    end

    def dir
      root.attr('dir').to_s
    end

    def id
      root.attr('id').to_s
    end

    # TODO: to do parse of
    # DCMES Optional Elements [0 or more]
    #   contributor
    #   coverage
    #   creator
    #   date
    #   description
    #   format
    #   publisher
    #   relation
    #   rights
    #   source
    #   subject
    #   type
    # meta [1 or more]
    # OPF2 meta [0 or more]
    # link [0 or more]

    ############
    # Metadata #
    ############
    def metadata
      root.css('metadata')
    end

    def identifiers
      metadata.css('identifier')
    end

    def titles
      metadata.css('title')
    end

    def languages
      metadata.css('language')
    end

    def creators
      metadata.css('creator')
    end

    def contributors
      metadata.css('contributor')
    end

    def meta
      metadata.css('meta')
    end

    def meta
      metadata.css('link')
    end
  end
end
