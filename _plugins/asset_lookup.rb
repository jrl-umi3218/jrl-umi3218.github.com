# jekyll-polyglot excludes exclude_from_localization paths (assets, css, js, ...)
# from site.static_files during non-default-language builds, so templates that
# scan site.static_files to find member photos, project images or bib files
# always miss on those passes. These filters check the filesystem directly,
# independent of which language is currently being built.
module Jekyll
  module AssetLookup
    SOURCE_DIR = File.expand_path("..", __dir__)

    def asset_exists(path)
      File.file?(File.join(SOURCE_DIR, path.to_s))
    end

    def assets_in_dir(prefix)
      dir = File.join(SOURCE_DIR, prefix.to_s)
      return [] unless Dir.exist?(dir)

      Dir.children(dir).sort.filter_map do |name|
        full_path = File.join(dir, name)
        File.join(prefix.to_s, name) if File.file?(full_path)
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::AssetLookup)
