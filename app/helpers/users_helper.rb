module UsersHelper
  def link_to_twitter(user)
    user.twitter.present? ? link_to(image_tag('logos/twitter'), user.twitter, :class => 'user-twitter-link') : ""
  end
end
