module Comments
  class Destroy
    include Interactor::Organizer

    organize Comments::Destroy::Execute
  end
end
