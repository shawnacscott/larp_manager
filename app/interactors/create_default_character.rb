class CreateDefaultCharacter
  include Interactor

  def call
    character = Character.create(
      name: "Default Character",
      profile_id: context.profile_id
    )

    if character.persisted?
      context.character_id = character.id
    else
      context.fail!(error: "Character not persisted")
    end
  end

  def rollback
    character = Character.find(context.character_id)
    character.destroy
  end
end
