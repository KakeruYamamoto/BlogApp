module BlogsHelper
  def choose_new_or_edit_blog#メソッドがfeedと重複しているため変更
    if action_name == 'new' || action_name == 'confirm'|| action_name == 'create' #|| action_name == 'create'を追加
      confirm_blogs_path
    elsif action_name == 'edit'
      blog_path
    end
  end
end
