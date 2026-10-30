module Brevo
  class ContactService
    DEFAULT_LIST_ID = 3.freeze
    DEFAULT_DOUBLE_OPT_IN_TEMPLATE_ID = 1.freeze

    def self.subscribe(user, should_opt_in_pixel_tracking)
      api_instance = Brevo::ContactsApi.new
      create_doi_contact = Brevo::CreateDoiContact.new({
        email: user.email,
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
