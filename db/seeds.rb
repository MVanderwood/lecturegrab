# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create({
  email: 'admin@admin.com',
  first_name: 'Michael',
  last_name: 'Vanderwood',
  role: 'administrator'
  })
Subject.create({
  name: 'American History',
  description: 'History of the Americas going from ancient times to modern day. Include Native American History, North American History and Latin American History.'
  })
Subject.create({
  name: 'Biology',
  description: 'The study of living beings. Ranges from sub-cellular construction to large organism biology and evolution.'
  })
Lecture.create({
  subject_id: 1,
  title: 'George Washington - Pre-Presedency',
  content: 'George Washington was born in Virginia, the son of a wealthy plantaion owner. He joined the British military as a young man, and was somewhat well known for career in the 7-years war, fought between the British and the French. He went on to help form the continental army, which would resist the British in the American Revolution. He led the continental army to victory as a general in their army.'
  })
Lecture.create({
  subject_id: 1,
  title: 'World War I - Introduction',
  content: 'In the early 1900s, European Imperialism was coming to a boiling point. The royal families were at each others throats about territory and economic expansion. The Europe and the United States were also in the middle of the Industrial Revolution. The tipping point was the assasination of Franz Ferdinand, a prince and dignitary in Austria. It resulted in war the likes the world had never seen.'
  })
Lecture.create({
  subject_id: 2,
  title: 'Evolution - Introduction',
  content: 'In the mid-19th century, Charles Darwin formulated the scientific theory of evolution by natural selection, published in his book On the Origin of Species (1859). Evolution by natural selection is a process demonstrated by the observation that more offspring are produced than can possibly survive, along with three facts about populations: 1) traits vary among individuals with respect to morphology, physiology, and behaviour (phenotypic variation), 2) different traits confer different rates of survival and reproduction (differential fitness), and 3) traits can be passed from generation to generation (heritability of fitness). Thus, in successive generations members of a population are replaced by progeny of parents better adapted to survive and reproduce in the biophysical environment in which natural selection takes place. This teleonomy is the quality whereby the process of natural selection creates and preserves traits that are seemingly fitted for the functional roles they perform. Natural selection is the only known cause of adaptation but not the only known cause of evolution. Other, nonadaptive causes of microevolution include mutation and genetic drift.'
  })
Quote.create({
  user_id: 1,
  text: 'Fetters and headsmen were the coarse instruments which tyranny formerly employed; but the civilization of our age has refined the arts of despotism which seemed, however, to have been sufficiently perfected before. The excesses of monarchical power had devised a variety of physical means of oppression: the democratic republics of the present day have rendered it as entirely an affair of the mind as that will which it is intended to coerce. Under the absolute sway of an individual despot the body was attacked in order to subdue the soul, and the soul escaped the blows which were directed against it and rose superior to the attempt; but such is not the course adopted by tyranny in democratic republics; there the body is left free, and the soul is enslaved. The sovereign can no longer say, “You shall think as I do on pain of death;” but he says, “You are free to think differently from me, and to retain your life, your property, and all that you possess; but if such be your determination, you are henceforth an alien among your people. You may retain your civil rights, but they will be useless to you, for you will never be chosen by your fellow-citizens if you solicit their suffrages, and they will affect to scorn you if you solicit their esteem. You will remain among men, but you will be deprived of the rights of mankind. Your fellow-creatures will shun you like an impure being, and those who are most persuaded of your innocence will abandon you too, lest they should be shunned in their turn. Go in peace! I have given you your life, but it is an existence in comparably worse than death.”',
  author: 'Alexis de Tocqueville'
  })
Quote.create({
  user_id: 1,
  text: 'Look deep into nature, and then you will understand everything better.',
  author: 'Albert Einstein'
  })
Quote.create({
  user_id: 1,
  text: 'The free soul is rare, but you know it when you see it - basically because you feel good, very good, when you are near or with them.',
  author: 'Charles Bukowski'
  })
UserLecture.create({
  user_id: 1,
  lecture_id: 1
  })
UserLecture.create({
  user_id: 1,
  lecture_id: 2
  })
UserLecture.create({
  user_id: 1,
  lecture_id: 3
  })
UserSubject.create({
  user_id: 1,
  subject_id: 1
  })
UserSubject.create({
  user_id: 1,
  subject_id: 2
  })
User.create({
  email: 'admin@admin.com',
  first_name: 'Michael',
  last_name: 'Vanderwood',
  role: 'administrator'
  })
User.create({
  email: 'admin@admin.com',
  first_name: 'Michael',
  last_name: 'Vanderwood',
  role: 'administrator'
  })
User.create({
  email: 'admin@admin.com',
  first_name: 'Michael',
  last_name: 'Vanderwood',
  role: 'administrator'
  })



