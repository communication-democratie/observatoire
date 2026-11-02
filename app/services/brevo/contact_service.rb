module Brevo
  class ContactService
    DEFAULT_LIST_ID = 3.freeze
    DEFAULT_DOUBLE_OPT_IN_TEMPLATE_ID = 1.freeze

    def self.subscribe(email, should_opt_in_pixel_tracking)
      api_instance = Brevo::ContactsApi.new

      # Search for existing contact
      begin
        result = api_instance.get_contact_info(email, { identifier_type: "email_id" })
        return if result # Contact already exists, we stop here.
      rescue Brevo::ApiError => e
        raise e unless e.code == 404 # Only raise if the error is not "Contact not found".
      end

      create_doi_contact = Brevo::CreateDoiContact.new({
        email: email,
        attributes: {
          _PIXEL_TRACKING_CONSENT: should_opt_in_pixel_tracking
        },
        includeListIds: [DEFAULT_LIST_ID],
        templateId: DEFAULT_DOUBLE_OPT_IN_TEMPLATE_ID,
        redirectionUrl: ENV['SITE_URL']
      })

      api_instance.create_doi_contact(create_doi_contact)
    end
  end
end
