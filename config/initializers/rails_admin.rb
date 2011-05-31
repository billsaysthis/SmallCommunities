RailsAdmin.config do |config|
  config.included_models = [Event,Speaker,User,Membership,Photo,StatPage,Setting,Linkage,Lookup]
  config.navigation.max_visible_tabs config.included_models.count

  config.model User do
    edit do
      field :first_name
      field :last_name
      field :email
      field :is_admin
      field :joined_on, :date
      field :street
      field :city
      field :state
      field :zip, :integer
      field :phone
      field :url
      field :logo
      field :label
      field :linkedin
      field :facebook
      field :twitter
      field :foursquare
      field :volunteer_title
    end
  end

  # config.model Membership do
  # end
  
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
      field :status
      field :speakers do
        orderable true
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
      field :events
    end
  end
  
end