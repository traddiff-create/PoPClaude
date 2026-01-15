// CivicsData.kt
// PoP - People Over Party
// 100 USCIS Civics Test Questions
// Source: U.S. Citizenship and Immigration Services

package com.pop.shared.data

import com.pop.shared.models.CivicsCategory
import com.pop.shared.models.CivicsQuestion

/**
 * Complete set of 100 USCIS civics test questions.
 * These are the official questions for the naturalization test.
 */
object CivicsData {

    val questions: List<CivicsQuestion> = listOf(
        // AMERICAN GOVERNMENT - Principles of American Democracy (Questions 1-12)
        CivicsQuestion(1, "What is the supreme law of the land?", "The Constitution", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(2, "What does the Constitution do?", "Sets up the government, defines the government, and protects basic rights of Americans", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(3, "The idea of self-government is in the first three words of the Constitution. What are these words?", "We the People", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(4, "What is an amendment?", "A change or addition to the Constitution", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(5, "What do we call the first ten amendments to the Constitution?", "The Bill of Rights", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(6, "What is one right or freedom from the First Amendment?", "Speech, religion, assembly, press, or petition the government", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(7, "How many amendments does the Constitution have?", "27", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(8, "What did the Declaration of Independence do?", "Announced our independence from Great Britain, declared our independence, and said the United States is free", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(9, "What are two rights in the Declaration of Independence?", "Life, liberty, and the pursuit of happiness", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(10, "What is freedom of religion?", "You can practice any religion, or not practice a religion", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(11, "What is the economic system in the United States?", "Capitalist economy or market economy", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(12, "What is the \"rule of law\"?", "Everyone must follow the law. Leaders must obey the law. Government must obey the law. No one is above the law.", CivicsCategory.AMERICAN_GOVERNMENT),

        // System of Government (Questions 13-47)
        CivicsQuestion(13, "Name one branch or part of the government.", "Congress, Legislative, President, Executive, the courts, or Judicial", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(14, "What stops one branch of government from becoming too powerful?", "Checks and balances, or separation of powers", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(15, "Who is in charge of the executive branch?", "The President", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(16, "Who makes federal laws?", "Congress, the Senate and House of Representatives, or the U.S. Legislature", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(17, "What are the two parts of the U.S. Congress?", "The Senate and House of Representatives", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(18, "How many U.S. Senators are there?", "100", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(19, "We elect a U.S. Senator for how many years?", "6 years", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(20, "Who is one of your state's U.S. Senators now?", "Answers vary by state (South Dakota: John Thune, Mike Rounds)", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(21, "The House of Representatives has how many voting members?", "435", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(22, "We elect a U.S. Representative for how many years?", "2 years", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(23, "Name your U.S. Representative.", "Answers vary by district", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(24, "Who does a U.S. Senator represent?", "All people of the state", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(25, "Why do some states have more Representatives than other states?", "Because of the state's population, because they have more people, or because some states have more people", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(26, "We elect a President for how many years?", "4 years", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(27, "In what month do we vote for President?", "November", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(28, "What is the name of the President of the United States now?", "Current President (answers change with elections)", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(29, "What is the name of the Vice President of the United States now?", "Current Vice President (answers change with elections)", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(30, "If the President can no longer serve, who becomes President?", "The Vice President", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(31, "If both the President and the Vice President can no longer serve, who becomes President?", "The Speaker of the House", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(32, "Who is the Commander in Chief of the military?", "The President", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(33, "Who signs bills to become laws?", "The President", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(34, "Who vetoes bills?", "The President", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(35, "What does the President's Cabinet do?", "Advises the President", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(36, "What are two Cabinet-level positions?", "Secretary of State, Secretary of Treasury, Secretary of Defense, Attorney General, and others", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(37, "What does the judicial branch do?", "Reviews laws, explains laws, resolves disputes, and decides if a law goes against the Constitution", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(38, "What is the highest court in the United States?", "The Supreme Court", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(39, "How many justices are on the Supreme Court?", "9", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(40, "Who is the Chief Justice of the United States now?", "Current Chief Justice (check current appointment)", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(41, "Under our Constitution, some powers belong to the federal government. What is one power of the federal government?", "To print money, declare war, create an army, or make treaties", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(42, "Under our Constitution, some powers belong to the states. What is one power of the states?", "Provide schooling and education, provide protection (police), provide safety (fire departments), give a driver's license, or approve zoning and land use", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(43, "Who is the Governor of your state now?", "Current Governor (South Dakota: check current)", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(44, "What is the capital of your state?", "Pierre (South Dakota)", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(45, "What are the two major political parties in the United States?", "Democratic and Republican", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(46, "What is the political party of the President now?", "Current President's party (changes with elections)", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(47, "What is the name of the Speaker of the House of Representatives now?", "Current Speaker (check current)", CivicsCategory.AMERICAN_GOVERNMENT),

        // Rights and Responsibilities (Questions 48-57)
        CivicsQuestion(48, "There are four amendments to the Constitution about who can vote. Describe one of them.", "Citizens 18 and older can vote. Any citizen can vote (women and men). A male citizen of any race can vote. You don't have to pay to vote.", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(49, "What is one responsibility that is only for United States citizens?", "Serve on a jury or vote in a federal election", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(50, "Name one right only for United States citizens.", "Vote in a federal election or run for federal office", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(51, "What are two rights of everyone living in the United States?", "Freedom of expression, freedom of speech, freedom of assembly, freedom to petition the government, freedom of religion, or the right to bear arms", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(52, "What do we show loyalty to when we say the Pledge of Allegiance?", "The United States and the flag", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(53, "What is one promise you make when you become a United States citizen?", "Give up loyalty to other countries, defend the Constitution and laws of the United States, obey the laws of the United States, serve in the U.S. military (if needed), serve the nation (if needed), or be loyal to the United States", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(54, "How old do citizens have to be to vote for President?", "18 and older", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(55, "What are two ways that Americans can participate in their democracy?", "Vote, join a political party, help with a campaign, join a civic group, join a community group, give an elected official your opinion, call Senators and Representatives, publicly support or oppose an issue or policy, run for office, or write to a newspaper", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(56, "When is the last day you can send in federal income tax forms?", "April 15", CivicsCategory.AMERICAN_GOVERNMENT),
        CivicsQuestion(57, "When must all men register for the Selective Service?", "At age 18, or between 18 and 26", CivicsCategory.AMERICAN_GOVERNMENT),

        // AMERICAN HISTORY - Colonial Period and Independence (Questions 58-70)
        CivicsQuestion(58, "What is one reason colonists came to America?", "Freedom, political liberty, religious freedom, economic opportunity, practice their religion, or escape persecution", CivicsCategory.AMERICAN_HISTORY),
        CivicsQuestion(59, "Who lived in America before the Europeans arrived?", "American Indians or Native Americans", CivicsCategory.AMERICAN_HISTORY),
        CivicsQuestion(60, "What group of people was taken to America and sold as slaves?", "Africans or people from Africa", CivicsCategory.AMERICAN_HISTORY),
        CivicsQuestion(61, "Why did the colonists fight the British?", "Because of high taxes (taxation without representation), because the British army stayed in their houses, or because they didn't have self-government", CivicsCategory.AMERICAN_HISTORY),
        CivicsQuestion(62, "Who wrote the Declaration of Independence?", "Thomas Jefferson", CivicsCategory.AMERICAN_HISTORY),
        CivicsQuestion(63, "When was the Declaration of Independence adopted?", "July 4, 1776", CivicsCategory.AMERICAN_HISTORY),
        CivicsQuestion(64, "There were 13 original states. Name three.", "New Hampshire, Massachusetts, Rhode Island, Connecticut, New York, New Jersey, Pennsylvania, Delaware, Maryland, Virginia, North Carolina, South Carolina, Georgia", CivicsCategory.AMERICAN_HISTORY),
        CivicsQuestion(65, "What happened at the Constitutional Convention?", "The Constitution was written, or the Founding Fathers wrote the Constitution", CivicsCategory.AMERICAN_HISTORY),
        CivicsQuestion(66, "When was the Constitution written?", "1787", CivicsCategory.AMERICAN_HISTORY),
        CivicsQuestion(67, "The Federalist Papers supported the passage of the U.S. Constitution. Name one of the writers.", "James Madison, Alexander Hamilton, John Jay, or Publius", CivicsCategory.AMERICAN_HISTORY),
        CivicsQuestion(68, "What is one thing Benjamin Franklin is famous for?", "U.S. diplomat, oldest member of the Constitutional Convention, first Postmaster General, writer of \"Poor Richard's Almanac\", or started the first free libraries", CivicsCategory.AMERICAN_HISTORY),
        CivicsQuestion(69, "Who is the \"Father of Our Country\"?", "George Washington", CivicsCategory.AMERICAN_HISTORY),
        CivicsQuestion(70, "Who was the first President?", "George Washington", CivicsCategory.AMERICAN_HISTORY),

        // 1800s (Questions 71-77)
        CivicsQuestion(71, "What territory did the United States buy from France in 1803?", "The Louisiana Territory or Louisiana", CivicsCategory.AMERICAN_HISTORY),
        CivicsQuestion(72, "Name one war fought by the United States in the 1800s.", "War of 1812, Mexican-American War, Civil War, or Spanish-American War", CivicsCategory.AMERICAN_HISTORY),
        CivicsQuestion(73, "Name the U.S. war between the North and the South.", "The Civil War or the War between the States", CivicsCategory.AMERICAN_HISTORY),
        CivicsQuestion(74, "Name one problem that led to the Civil War.", "Slavery, economic reasons, or states' rights", CivicsCategory.AMERICAN_HISTORY),
        CivicsQuestion(75, "What was one important thing that Abraham Lincoln did?", "Freed the slaves (Emancipation Proclamation), saved (or preserved) the Union, or led the United States during the Civil War", CivicsCategory.AMERICAN_HISTORY),
        CivicsQuestion(76, "What did the Emancipation Proclamation do?", "Freed the slaves, freed slaves in the Confederacy, freed slaves in the Confederate states, or freed slaves in most Southern states", CivicsCategory.AMERICAN_HISTORY),
        CivicsQuestion(77, "What did Susan B. Anthony do?", "Fought for women's rights or fought for civil rights", CivicsCategory.AMERICAN_HISTORY),

        // Recent American History (Questions 78-87)
        CivicsQuestion(78, "Name one war fought by the United States in the 1900s.", "World War I, World War II, Korean War, Vietnam War, or Gulf War", CivicsCategory.AMERICAN_HISTORY),
        CivicsQuestion(79, "Who was President during World War I?", "Woodrow Wilson", CivicsCategory.AMERICAN_HISTORY),
        CivicsQuestion(80, "Who was President during the Great Depression and World War II?", "Franklin Roosevelt", CivicsCategory.AMERICAN_HISTORY),
        CivicsQuestion(81, "Who did the United States fight in World War II?", "Japan, Germany, and Italy", CivicsCategory.AMERICAN_HISTORY),
        CivicsQuestion(82, "Before he was President, Eisenhower was a general. What war was he in?", "World War II", CivicsCategory.AMERICAN_HISTORY),
        CivicsQuestion(83, "During the Cold War, what was the main concern of the United States?", "Communism", CivicsCategory.AMERICAN_HISTORY),
        CivicsQuestion(84, "What movement tried to end racial discrimination?", "Civil rights movement", CivicsCategory.AMERICAN_HISTORY),
        CivicsQuestion(85, "What did Martin Luther King, Jr. do?", "Fought for civil rights or worked for equality for all Americans", CivicsCategory.AMERICAN_HISTORY),
        CivicsQuestion(86, "What major event happened on September 11, 2001, in the United States?", "Terrorists attacked the United States", CivicsCategory.AMERICAN_HISTORY),
        CivicsQuestion(87, "Name one American Indian tribe in the United States.", "Cherokee, Navajo, Sioux, Chippewa, Choctaw, Pueblo, Apache, Iroquois, Creek, Blackfeet, Seminole, Cheyenne, Arawak, Shawnee, Mohegan, Huron, Oneida, Lakota, Crow, Teton, Hopi, Inuit, and many others", CivicsCategory.AMERICAN_HISTORY),

        // INTEGRATED CIVICS - Geography (Questions 88-95)
        CivicsQuestion(88, "Name one of the two longest rivers in the United States.", "Missouri River or Mississippi River", CivicsCategory.INTEGRATED_CIVICS),
        CivicsQuestion(89, "What ocean is on the West Coast of the United States?", "Pacific Ocean", CivicsCategory.INTEGRATED_CIVICS),
        CivicsQuestion(90, "What ocean is on the East Coast of the United States?", "Atlantic Ocean", CivicsCategory.INTEGRATED_CIVICS),
        CivicsQuestion(91, "Name one U.S. territory.", "Puerto Rico, U.S. Virgin Islands, American Samoa, Northern Mariana Islands, or Guam", CivicsCategory.INTEGRATED_CIVICS),
        CivicsQuestion(92, "Name one state that borders Canada.", "Maine, New Hampshire, Vermont, New York, Pennsylvania, Ohio, Michigan, Minnesota, North Dakota, Montana, Idaho, Washington, or Alaska", CivicsCategory.INTEGRATED_CIVICS),
        CivicsQuestion(93, "Name one state that borders Mexico.", "California, Arizona, New Mexico, or Texas", CivicsCategory.INTEGRATED_CIVICS),
        CivicsQuestion(94, "What is the capital of the United States?", "Washington, D.C.", CivicsCategory.INTEGRATED_CIVICS),
        CivicsQuestion(95, "Where is the Statue of Liberty?", "New York Harbor or Liberty Island (also acceptable: New Jersey, near New York City, on the Hudson River)", CivicsCategory.INTEGRATED_CIVICS),

        // Symbols and Holidays (Questions 96-100)
        CivicsQuestion(96, "Why does the flag have 13 stripes?", "Because there were 13 original colonies or because the stripes represent the original colonies", CivicsCategory.INTEGRATED_CIVICS),
        CivicsQuestion(97, "Why does the flag have 50 stars?", "Because there is one star for each state, because each star represents a state, or because there are 50 states", CivicsCategory.INTEGRATED_CIVICS),
        CivicsQuestion(98, "What is the name of the national anthem?", "The Star-Spangled Banner", CivicsCategory.INTEGRATED_CIVICS),
        CivicsQuestion(99, "When do we celebrate Independence Day?", "July 4", CivicsCategory.INTEGRATED_CIVICS),
        CivicsQuestion(100, "Name two national U.S. holidays.", "New Year's Day, Martin Luther King Jr. Day, Presidents' Day, Memorial Day, Independence Day, Labor Day, Columbus Day, Veterans Day, Thanksgiving, Christmas", CivicsCategory.INTEGRATED_CIVICS)
    )

    /**
     * Filter questions by category
     */
    fun questionsByCategory(category: CivicsCategory): List<CivicsQuestion> =
        questions.filter { it.category == category }

    /**
     * Get a random question
     */
    fun randomQuestion(): CivicsQuestion = questions.random()

    /**
     * Get all questions in random order
     */
    fun shuffledQuestions(): List<CivicsQuestion> = questions.shuffled()

    /**
     * Get question by ID
     */
    fun questionById(id: Int): CivicsQuestion? = questions.find { it.id == id }

    /**
     * Count of questions in each category
     */
    val categoryCounts: Map<CivicsCategory, Int> by lazy {
        questions.groupBy { it.category }.mapValues { it.value.size }
    }
}
