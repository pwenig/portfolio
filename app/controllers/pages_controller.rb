class PagesController < ApplicationController
  def blog
  end

  def education
  end

  def portfolio
    @projects = Project.all
  end

  def contact
  end

  def experience
  end

  def profile
  end
end
