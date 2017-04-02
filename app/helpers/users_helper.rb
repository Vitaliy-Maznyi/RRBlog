module UsersHelper

  def show_avatar(user)
    if user.avatar?
      image_tag user.avatar.url(:thumb)
    else
      image_tag 'avatar/avatar_default.png'
    end
  end

end