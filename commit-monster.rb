# frozen_string_literal: true

require 'erb'
require 'date'

def update_readme
  template = File.open("template.md.erb").read
  filename = "README.md"

  @updated_at = DateTime.now.strftime("%B %d, %Y %H:%M:%S %:z")
  renderer = ERB.new(template)
  File.open(filename, 'w').write(renderer.result)
end

def push_changes
  message = pick_a_message
  `git commit -am "#{message}"`
  `git push`
end

def pick_a_message
  [
    "C is for commit that's good enough for me.", 
    "Om Nom Nom Nom.", 
    "Home is where heart is. Heart where commit is. Math clear: home is commit.",
    "Sometimes me think, what is friend? And then me say: a friend is someone to share last commit with.",
    "Fruit… or commit… Fruit… commit… Me Commit Monster! This No-Brainer!",
    "Me love poetry… and commits!",
    "Me wasn’t born with name Commit Monster. It just nickname dat stuck. Me don’t remember me real name… Maybe it was Sidney?",
    "Today me will live in the moment, unless it’s unpleasant in which case me will eat a commit.",
    "Who care if me eat carrot or collard greens. Me also like broccoli and lettuce and lima beans. Me still commit monster. That not a sham.",
    "I’d give you a commit, but I ate it.",
    "Me Love to Eat commits. Sometimes eat whole, sometimes me chew it.",
    "Keep Calm & Eat commits.",
    "No get upset, okay? Don’t get excited. Me not fussy — just give me box of commits.",
    "Me lost me commit at the disco.",
    "Me just met you and this is crazy, but you got commit, so share it maybe?",
    "That what wrong with the media today. All they have is questions, questions, questions. They never have commits.",
  ].sample
end

update_readme
push_changes