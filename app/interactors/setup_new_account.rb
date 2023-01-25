class SetupNewAccount
  include Interactor::Organizer

  organize CreateProfile, CreateDefaultCharacter
end
