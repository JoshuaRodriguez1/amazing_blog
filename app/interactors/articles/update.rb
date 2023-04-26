module Articles
  class Update
    include Interactor::Organizer

    organize Articles::Update::Execute
  end
end
