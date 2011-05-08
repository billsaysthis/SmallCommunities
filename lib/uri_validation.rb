require 'addressable/uri'

module URI_Validation
  # If the URI library can parse the value, and the scheme is valid
  # then we assume the url is valid
  #
  class UrlValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      return true unless value.present?
      begin
        uri = Addressable::URI.parse(value)

        if !["http","https","ftp"].include?(uri.scheme)
          raise Addressable::URI::InvalidURIError
        end
      rescue Addressable::URI::InvalidURIError
        record.errors[attribute] << "Invalid URL"
      end
    end
  end

end