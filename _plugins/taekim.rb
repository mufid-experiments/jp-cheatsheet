# frozen_string_literal: true

# {% taekim 3.2.3 4.1.4 %}: sections of Tae Kim's book, A Guide to Japanese
# Grammar, by number, from _data/taekim.yml. Each one shows its number,
# title and page in the book, linked to the same section of the online guide
# (guidetojapanese.org) where it has one; several are joined with ・.
#
#   **Tae Kim:** {% taekim 3.2.3 4.1.4 %}
#   {: .refs}
#
# A number that is not in _data/taekim.yml stops the build.

require "cgi"

module Cheatsheet
  class TaeKimTag < Liquid::Tag
    def initialize(tag_name, markup, parse_context)
      super
      @numbers = markup.split
      raise Liquid::SyntaxError, "taekim: give section numbers, like {% taekim 3.2.3 4.1.4 %}" if @numbers.empty?
    end

    def render(context)
      book = context.registers[:site].data.fetch("taekim")
      @numbers.map do |n|
        section = book[n] or raise ArgumentError, "taekim: #{n} is not a section in _data/taekim.yml"
        ref(n, section)
      end.join(" ・ ")
    end

    private

    def ref(n, section)
      label = %(<span class="num">#{n}</span> #{CGI.escapeHTML(section["title"])})
      page  = %(<span class="page">p. #{section["page"]}</span>)
      return %(<span class="taekim">#{label}</span> #{page}) unless section["url"]

      %(<a class="taekim" href="#{CGI.escapeHTML(section["url"])}">#{label}</a> #{page})
    end
  end
end

Liquid::Template.register_tag("taekim", Cheatsheet::TaeKimTag)
