module Comments
  class Create
    include Interactor::Organizer

    organize Comments::Create::Execute
  end
end
