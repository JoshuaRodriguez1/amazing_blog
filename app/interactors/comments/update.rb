module Comments
  class Update
    include Interactor::Organizer

    organize Comments::Update::Execute
  end 
end
