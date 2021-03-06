require "administrate/base_dashboard"

class ExchangeAccountDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    exchange: Field::Select.with_options(collection: ExchangeAccount::EXCHANGES.values),
    shrimpy_account_id: Field::String,
    shrimpy_user: Field::BelongsTo,
    public_key: Field::String,
    private_key: Field::String,
    status: Field::Select.with_options(collection: ExchangeAccount::STATUS.values),
    is_rebalancing: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    exchange
    shrimpy_user
    shrimpy_account_id
    status
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    exchange
    shrimpy_user
    shrimpy_account_id
    public_key
    private_key
    status
    is_rebalancing
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    exchange
    shrimpy_user
    shrimpy_account_id
    public_key
    private_key
    status
    is_rebalancing
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how exchange accounts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(exchange_account)
  #   "ExchangeAccount ##{exchange_account.id}"
  # end
end
