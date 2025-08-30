class ManufacturerResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :name
  attribute :manufacturer_type, index: true  # Moved here to control order
  attribute :created_at, form: false
  attribute :updated_at, form: false

  # Configure which attributes to show in the index view
  def self.index_attributes
    [:id, :name, :manufacturer_type, :created_at]
  end

  # Override the table columns method to ensure proper ordering
  def self.table_attributes
    [:id, :name, :manufacturer_type, :created_at]
  end

  # Add scopes to easily filter records
  # scope :published

  # Add actions to the resource's show page
  # member_action do |record|
  #   link_to "Do Something", some_path
  # end

  # Customize the display name of records in the admin area.
  def self.display_name(record) = record.name

  # Customize the default sort column and direction.
  # def self.default_sort_column = "created_at"
  #
  # def self.default_sort_direction = "desc"
end
