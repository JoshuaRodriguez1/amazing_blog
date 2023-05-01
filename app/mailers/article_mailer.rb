class ArticleMailer < ApplicationMailer
  def article_created(article)
    @user = article.user
    @title = article.title

    mail(to: @user.email)
  end

  def article_deleted(article)
    @user = article.user
    @title = article.title

    mail(to: @user.email)
  end

  def article_updated(article)
    @user = article.user
    @title = article.title

    mail(to: @user.email)
  end
end
