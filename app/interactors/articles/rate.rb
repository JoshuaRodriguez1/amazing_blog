module Articles
  class Rate
    include Interactor::Organizer

    organize Articles::Rate::Execute
  end
end
