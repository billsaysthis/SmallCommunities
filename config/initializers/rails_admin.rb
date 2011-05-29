RailsAdmin.config do |config|
  config.model StatPage do
    edit do
      field :title
      field :content_block, :text do
        ckeditor true
      end
    end
  end

  config.model Event do
    edit do
      field :title
      field :subtitle
      field :location
      field :page_template
      field :occurs_on, :date
      field :description, :text do
        ckeditor true
      end
      field :regular_paypal do
        help 'Enter PayPayl button GUID code'
      end
      field :special_paypal do
        help 'Enter PayPayl button GUID code'
      end
      field :special_pricing
      field :show_sponsors
      # TODO this should be a select widget, needs investigation
      field :status
      field :speakers do
        # TODO this should not cause a 500 error, needs investigation
        # orderable true
      end
    end
  end

  config.model Photo do
    edit do
      field :filename
      field :caption
      field :lookups
      field :active
    end
  end
  
  config.model Speaker do
    edit do
      field :name
      field :url
      field :image_url
      field :bio, :text do
        ckeditor true
      end
    end
  end
  
end