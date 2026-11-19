Rails.application.config.to_prepare do
  ActiveStorage::Engine.config.active_storage.content_types_to_serve_as_binary.delete('image/svg+xml')

  # Override ActiveStorage::Filename#sanitized to remove accents and all special chars
  # Base method: https://github.com/rails/rails/blob/v8.1.4.1/activestorage/app/models/active_storage/filename.rb#L57
  ActiveStorage::Filename.class_eval do
    def sanitized
      sanitized_value = @filename.encode(Encoding::UTF_8, invalid: :replace, undef: :replace, replace: "�")
                          .strip
                          .tr("\u{202E}\u{0000}%$|:;/<>?*\"\t\r\n\\", "-")

      sanitized_extension = File.extname(sanitized_value)
      sanitized_base = File.basename(sanitized_value, sanitized_extension)
      sanitized_base = sanitized_base.parameterize(preserve_case: true)
      [sanitized_base, sanitized_extension].join('')
    end
  end
end
