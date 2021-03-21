# frozen_string_literal: true

module ProfilesHelper
  def current_user_profile?
    current_user == @user
  end

  def not_current_user_profile?
    !current_user_profile?
  end

  def not_following_user?
    not_current_user_profile? && !current_user.following?(@user)
  end

  def following_user?
    not_current_user_profile? && current_user.following?(@user)
  end

  def show_link_if(condition, name, options = {}, html_options = {}, &block)
    if condition
      link_to(name, options, html_options)
    elsif block_given?
      block.arity <= 1 ? capture(name, &block) : capture(name, options, html_options, &block)
    end
  end
end
