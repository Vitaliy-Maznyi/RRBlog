module UsersHelper
  def show_avatar(user)
    if user.avatar?
      image_tag user.avatar.url(:thumb), class: 'avatar-image'
    else
      image_tag gravatar_url(user.email, 80), alt: '', class: 'avatar-image'
    end
  end
end
