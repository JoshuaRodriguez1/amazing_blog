class CommentMailer < ApplicationMailer
  def comment_created(comment)
    @owner_email = comment.article.user.email
    @commenter = comment.user
    @article = comment.article
    @content = comment.content

    mail(to: @owner_email)
  end
end
