hackathon = Hackathon.find_or_create_by_name('Coshx Hack 2012.08')
hackathon.starts_at = Time.new(2012, 8, 23, 0, 0, 0).utc
hackathon.ends_at = Time.new(2012, 8, 25, 0, 0, 0).utc
hackathon.judging_starts_at = Time.new(2012, 8, 25, 0, 0, 0).utc
hackathon.judging_ends_at = Time.new(2012, 9, 1, 0, 0, 0).utc
hackathon.description = '48 hour free-for-all, where anything goes as long as you\'re explicit about what was done during the 48 hours. Every project should have a README (or README.md) file that describes what was done, along with any other relevant information for the judges.'
hackathon.save!

## users (purposefully leaving out emails from the repo)

# admin
user = User.find_or_create_by_github_name('btaitelb')
hackathon.judges << user
hackathon.admins << user
hackathon.participants << user
hackathon.save!

# judges
user = User.find_or_create_by_github_name('lukemelia')
user.name = 'Luke Melia'
hackathon.judges << user
hackathon.save!

user = User.find_or_create_by_github_name('tarcieri')
user.name = 'Tony Arcieri'
hackathon.judges << user
hackathon.save!

user = User.find_or_create_by_github_name('joemellin')
user.name = 'Joe Mellin'
hackathon.judges << user
hackathon.save!

user = User.find_or_create_by_github_name('kylefiedler')
user.name = 'Kyle Fiedler'
hackathon.judges << user
hackathon.save!

# TODO: participants

award = hackathon.awards.find_or_create_by_name('Creativity')
award.description = 'This is for a team that comes up with something truly original. It could be a new spin on an existing idea, or something completely out of left field. It\'s important to keep our creative juices flowing and to find inspiration everywhere :)'
award.prize = 'a single ice cube, slowly melting in a river of meditation. oh fuck it, have a $100 amazon gift card and get creative yourself.'
award.save!

award = hackathon.awards.find_or_create_by_name('Notable Teamwork')
award.description = 'Everyone on the team had something to offer, and worked together well. Being on this team is likely its own reward, but heck, have a prize as well :D'
award.prize = 'Since you work so well as a team, figure out what to do with $500 as a team.'
award.save!

award = hackathon.awards.find_or_create_by_name('Notable Distributed Team')
award.description = 'Working with a distributed team is hard, but with all of our remote offices, this is an important skill to gain. We want to reward those who choose a distributed team for the hackathon.'
award.prize = 'Get together in person and celebrate! Choose one of the team members\' locations, along with a week that works for everyone, and Coshx will fly the others there, put them up for the week, and sponsor some team-building events during that week.'
award.save!

award = hackathon.awards.find_or_create_by_name('Awesome Failure')
award.description = 'Take a bow. No seriously, take a failure bow! So your project sucked. Maybe it was just a bad idea, or maybe you bit off more than you could chew. Oh well, it was a learning experience, and while you might be frustrated now, we tend to learn more from our failures than our successes, so failing early and often is a great way to grow.'
award.prize = 'a spirit of your choosing, up to $20 in value... "oh alcohol, the cause and solution to all of life\'s problems"'
award.save!

award = hackathon.awards.find_or_create_by_name('MVMVP')
award.description = 'Congratulations, you achieved your value proposition in a short timeframe! Start blogging about it and getting it out to others who find it useful. Whats that? Oh, it\'s just an investment firm calling, tell them to take a number and you\'ll call them back after the betabeat and techcrunch interviews. (this won\'t be awarded every hackathon, as it is saved for projects that the judges feel should move forward as a product)'
award.prize = '$25k internal budget to launch this startup. Engineering hours will be billed at $80/hr out of this budget, and the rest is at your discretion.'
award.save!

award = hackathon.awards.find_or_create_by_name('Polished')
award.description = 'Wow, this app looks professional. Are you sure you didn\'t cheat and start a couple weeks or months before the hackathon?'
award.prize = 'You probably need new monitors, or ipads with retina displays to view the awesomeness of your creation. $1000 each to spend on technology should help with this problem.'
award.save!

award = hackathon.awards.find_or_create_by_name('Taking One for the Team')
award.description = 'You didn\'t work on some cool, flashy idea, but instead hunkered down and built something really useful for our team. You\'re awesome!'
award.prize = 'Recognition from the rest of the team, and a $100 amazon gift card.'
award.save!

award = hackathon.awards.find_or_create_by_name('Visibility')
award.description = 'Your project (or your blogging, tweeting, sharing on HN, shouting in the food court, getting arrested and making the 8 o\'clock news) gained us notable positive attention that may result in future projects or high-quality applicants. Thanks!'
award.prize = 'A bunch of random people on the internet are now paying attention to you, isn\'t that enough? Fine, have a $100 amazon gift card as well.'
award.save!

award = hackathon.awards.find_or_create_by_name('Community')
award.description = 'Your project contributes something valuable to the open source community. This is something we can all be proud of.'
award.prize = '$100 amazon gift card'
award.save!

project = Project.find_or_create_by_name('Schedule Share')
project.abstract = 'Create a service for sharing schedule information with different clients based on multiple input calendars and tagging.'
project.save!
hackathon.projects << project

project = Project.find_or_create_by_name('Motion Diner')
project.abstract = 'A reliable, 0-friction way to find food trucks that are open for business right now near me.'
project.save!
hackathon.projects << project

project = Project.find_or_create_by_name('Weather Rooster')
project.abstract = 'ranks different sources of local weather by their accuracy over time, so that people know which weather forecast they should trust. Also, individuals and TV stations can sign up to offer their predictions and compete with each other to be the most accurate.'
project.save!
hackathon.projects << project

project = Project.find_or_create_by_name('Bible Share')
project.abstract = 'Bibleshare provides an useful tool for online group bible sharing/discussion. One can enter something like John 13:1-17 and the passage will be created. People can post their thoughts and meditations about the scripture. The passage will be visible as people write their thoughts, so they don\'t have to move back and forth between monitor and bible. If one wants to refer to another passage, he can type something like @Rome 3:31 and it will display the verse in the post. People can comment on individual post. All posts will be visible at the same time, so no going back and forth is necessary. A scripture can be either made public for open discussion and sharing, or private for closed group sharing.'
project.save!
hackathon.projects << project

project = Project.find_or_create_by_name('Hackathons')
project.abstract = 'Manage hackathons and judging with ease. You\'re currently using the demo app :)'
project.github_url = "https://github.com/coshx/hackathons"
project.url = "http://hackathons.coshx.com"
project.save!
hackathon.projects << project

