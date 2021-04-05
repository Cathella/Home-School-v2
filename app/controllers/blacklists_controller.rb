class BlacklistsController < ApplicationController
  [%w(add_to_blacklist save), %w(remove_from_blacklist destroy)].each do |name, action|
    define_method name do
      user = params[:klass].constantize.find(params[:user])
      record = current_account.send(name, user)
      record.send(action) ? (redirect_to user.class.name.downcase.pluralize.sym) : (redirect_to :root)
    end
  end

  def blacklist
    @blacklist = current_account.my_blacklist
  end
end
