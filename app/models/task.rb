class Task < ApplicationRecord
  has_many :task_pages
  has_many :pages, through: :task_pages
  has_many :task_tags
  has_many :tags, through: :task_tags
  has_many :task_users
  has_many :users, through: :task_users

  accepts_nested_attributes_for :tags
  accepts_nested_attributes_for :pages
  accepts_nested_attributes_for :users

  def tag_attributes=(tag_attributes)
    tag_attributes.values.each do |j|
      tag = Tag.find_or_create_by(j)
      self.tags << tag
    end
  end

  def page_attributes=(page_attributes)
    page_attributes.values.each do |j|
      page = Page.find_or_create_by(j)
      self.pages << page
    end
  end

  def user_attributes=(user_attributes)
    user_attributes.values.each do |j|
      user = User.find_or_create_by(j)
      self.users << user
    end
  end




  def task_tags
    self.tags
  end

  def task_pages
    self.pages
  end

  def task_users
    self.users
  end

  def task_info
    {task: self, tags: self.task_tags, pages: self.task_pages, users: self.task_users}
  end

  def find_save_tags(rel_tags)
    rel_tags.each do |t|
      @tag = Tag.all.find_or_create_by(title: t)
      self.tags << @tag
    end
  end

  def find_save_pages(rel_pages)
    rel_pages.each do |p|
      @page = Page.all.find_or_create_by(path: p)
      self.pages << @page
    end
  end

  def find_save_users(rel_users)
    rel_users.each do |u|
      @user = User.find_by(username: u)
      self.users << @user
    end

  end

  def find_save_update_tags(rel_tags)
    rel_tags.each do |t|
      @tag = Tag.all.find_or_create_by(title: t["title"])
      self.tags << @tag
    end
  end

  def find_save_update_pages(rel_pages)
    rel_pages.each do |p|
      @page = Page.all.find_or_create_by(path: p["path"])
      self.pages << @page

    end
  end

  def find_save_update_users(rel_users)
    rel_users.each do |u|
      @user = User.all.find_by(username: u["username"])
      self.users << @user
    end

  end

end
