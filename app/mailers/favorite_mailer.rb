class FavoriteMailer < ActionMailer::Base
  default from: "jlquaccia@gmail.com}"

  def new_comment(user, post, comment)
    # New Headers
    # could the headers be causing problems for me???
    headers["Message-ID"] = "<comments/#{comment.id}@jason-quaccia-bloccit.herokuapp.com"
    headers["In-Reply-To"] = "<post/#{post.id}@jason-quaccia-bloccit.herokuapp.com"
    headers["References"] = "<post/#{post.id}@jason-quaccia-bloccit.herokuapp.com" 

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
