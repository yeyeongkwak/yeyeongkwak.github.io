# frozen_string_literal: true

# Renders the mission front matter inside Chirpy's post layout.
module MissionSections
  SECTIONS = [
    ["mission", "Mission"],
    ["what_i_did", "What I did"],
    ["what_i_learned", "What I learned"],
    ["ai_prompt_used", "AI prompt used"],
    ["next_step", "Next step"]
  ].freeze

  module_function

  def markdown_for(post)
    SECTIONS.filter_map do |key, heading|
      value = post.data[key].to_s.strip
      next if value.empty?

      body = key == "ai_prompt_used" ? fenced(value) : value
      "## #{heading}\n\n#{body}\n"
    end.join("\n")
  end

  def fenced(value)
    fence = value.include?("```") ? "~~~~" : "```"
    "#{fence}\n#{value}\n#{fence}"
  end
end

Jekyll::Hooks.register :posts, :pre_render do |post|
  extra = MissionSections.markdown_for(post)
  next if extra.empty?

  post.content = "#{extra}\n#{post.content}"
end
