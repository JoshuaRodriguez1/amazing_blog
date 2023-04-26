module Articles
  class Destroy
    include Interactor::Organizer

    organize Articles::Destroy::Execute
  end
end
