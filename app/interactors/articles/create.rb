module Articles
  class Create
    include Interactor::Organizer

    organize Articles::Create::Execute, Articles::Create::CreateArticleTags
  end
end
