class CommentMailerPreview < ActionMailer::Preview
  def comment_created
    comment = Comment.last || FactoryBot.create(:comment)
    CommentMailer.comment_created(comment)
  end
end
