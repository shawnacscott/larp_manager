class CreateProfile
  include Interactor

  def call
    profile = Profile.create(user_id: context.user_id)

    if profile.persisted?
      context.profile_id = profile.id
    else
      context.fail!(error: "Profile not persisted")
    end
  end

  def rollback
    profile = Profile.find(context.profile_id)
    profile.destroy
  end
end
