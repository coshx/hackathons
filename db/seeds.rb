hackathon = Hackathon.find_or_create_by_name('Coshx Hack 2012.08')
hackathon.starts_at = Time.new(2012, 8, 23, 0, 0, 0).utc
hackathon.ends_at = Time.new(2012, 8, 25, 0, 0, 0).utc
hackathon.judging_starts_at = Time.new(2012, 8, 25, 0, 0, 0).utc
hackathon.judging_ends_at = Time.new(2012, 9, 1, 0, 0, 0).utc
hackathon.description = 'Description goes here...'
hackathon.save!

user = User.find_or_create_by_github_name('btaitelb')
hackathon.judges << user
hackathon.admins << user
hackathon.participants << user
hackathon.save!

award = hackathon.awards.find_or_create_by_name('Creativity')
award = hackathon.awards.find_or_create_by_name('Notable Teamwork')
award = hackathon.awards.find_or_create_by_name('Notable Distributed Team')
award = hackathon.awards.find_or_create_by_name('Awesome Failure')
award = hackathon.awards.find_or_create_by_name('MVMVP')
award = hackathon.awards.find_or_create_by_name('Polished')
award = hackathon.awards.find_or_create_by_name('Taking One for the Team')
award = hackathon.awards.find_or_create_by_name('Visibility')
award = hackathon.awards.find_or_create_by_name('Community')

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
project.abstract = 'Manage hackathons and judging with ease.'
project.github_url = "https://github.com/coshx/hackathons"
project.url = "http://hackathons.coshx.com"
project.save!
hackathon.projects << project

