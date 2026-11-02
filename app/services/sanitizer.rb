class Sanitizer
  def self.sanitize_string(string)
    output = Loofah.fragment(string).text(encode_special_chars: false)
    while output != Loofah.fragment(output).text(encode_special_chars: false)
      output = Loofah.fragment(output).text(encode_special_chars: false)
    end
    output.gsub("\r\n", "").gsub("\n", "")
  end
end
