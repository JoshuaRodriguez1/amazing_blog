module Articles
  class Create
    include Interactor::Organizer

    organize Articles::Create::Execute
  end
end
