module HackathonsHelper
  def my_review_for_project(project)
    project.reviews.select{|r| r.judge_id == current_user.id}.first ||
      Review.new(:judge_id => current_user.id)
  end

  def my_nominations_for_project(project)
    nominations = project.nominations.select{|n| n.judge_id == current_user.id}
    if nominations.empty?
      '(none)'
    else
      html = ''
      nominations.each do |n|
        html += content_tag('span', n.award.name.html_safe + link_to("&times;".html_safe, '#', :class => 'large', :id => n.id), :class => 'my-nomination')
      end
      html.html_safe
    end
  end
end
