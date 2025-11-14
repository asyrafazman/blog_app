# lib/tasks/create_red_velvet_posts.rake

namespace :posts do
  desc "Create 25 Red Velvet K-pop blog posts"
  task create_red_velvet: :environment do
    puts "🎵 Creating 25 Red Velvet blog posts..."
    
    # Get first user or create one
    user = User.first
    
    unless user
      puts "❌ No users found. Please create a user first!"
      exit
    end
    
    puts "✓ Using user: #{user.email}"
    
    # Red Velvet blog posts data
    posts_data = [
      {
        title: "Red Velvet's Dual Concept: Understanding the Red and Velvet",
        content: <<-HTML
          <h2>The Unique Concept Behind Red Velvet</h2>
          <p>Red Velvet is known for their innovative dual concept that sets them apart in the K-pop industry. The "Red" represents their vibrant, bold, and energetic side, while the "Velvet" showcases their mature, sophisticated, and elegant performances.</p>
          
          <h3>The Red Side</h3>
          <p>Songs like "Red Flavor," "Dumb Dumb," and "Rookie" perfectly embody the Red concept with their upbeat melodies, colorful music videos, and fun choreography. These tracks are energetic, playful, and full of life.</p>
          
          <h3>The Velvet Side</h3>
          <p>Tracks such as "Psycho," "Bad Boy," and "Kingdom Come" showcase their mature, sophisticated side. These songs feature complex production, deeper themes, and more refined choreography.</p>
          
          <p>This versatility has made Red Velvet one of the most respected girl groups in K-pop, proving they can master any concept thrown their way!</p>
        HTML
      },
      {
        title: "Irene: Red Velvet's Stunning Leader and Visual",
        content: <<-HTML
          <h2>Meet Bae Joo-hyun (Irene)</h2>
          <p>Irene, the leader and main rapper of Red Velvet, is widely recognized as one of the most beautiful idols in K-pop. Born on March 29, 1991, she's the oldest member and carries the responsibility of leading the group with grace.</p>
          
          <h3>Leadership Style</h3>
          <p>Despite her quiet demeanor, Irene is known for being a caring and protective leader who looks after all the members. She leads by example with her professionalism and dedication.</p>
          
          <h3>Talents Beyond Visuals</h3>
          <p>While she's famous for her stunning visuals, Irene is also an accomplished rapper and has shown her acting skills in various projects. Her solo activities continue to showcase her diverse talents.</p>
          
          <p>Irene's presence in Red Velvet is irreplaceable, bringing both beauty and substance to every performance!</p>
        HTML
      },
      {
        title: "Seulgi: The Dancing Machine and Main Vocalist",
        content: <<-HTML
          <h2>Kang Seul-gi - Red Velvet's All-Rounder</h2>
          <p>Seulgi, born on February 10, 1994, is considered one of the best dancers in K-pop. Her incredible technique, power, and grace make every performance memorable.</p>
          
          <h3>Dance Excellence</h3>
          <p>Seulgi trained for 7 years before debut, and it shows in every movement. She's praised by choreographers and fellow idols alike for her exceptional dancing abilities. Her stage presence is undeniable.</p>
          
          <h3>Vocal Abilities</h3>
          <p>Beyond dancing, Seulgi is one of Red Velvet's main vocalists. Her unique tone and emotional delivery add depth to the group's songs. She can handle both powerful and delicate vocals with ease.</p>
          
          <h3>Solo and Unit Activities</h3>
          <p>Seulgi has released solo music and collaborated in the sub-unit "Seulgi & Irene," proving her versatility as an artist!</p>
        HTML
      },
      {
        title: "Wendy: Red Velvet's Powerhouse Main Vocalist",
        content: <<-HTML
          <h2>Son Seung-wan (Wendy) - The Voice of Red Velvet</h2>
          <p>Wendy, born on February 21, 1994, is Red Velvet's main vocalist and one of the best vocalists in K-pop. Her powerful, stable, and emotional vocals are the backbone of Red Velvet's sound.</p>
          
          <h3>Vocal Training and Background</h3>
          <p>Wendy grew up in Canada and trained extensively in vocal performance. She studied music and participated in numerous singing competitions before joining SM Entertainment.</p>
          
          <h3>Technical Excellence</h3>
          <p>Her vocal range, technique, and emotional expression are consistently praised by vocal coaches. She can effortlessly hit high notes and deliver complex runs while maintaining perfect pitch.</p>
          
          <h3>Solo Debut: "Like Water"</h3>
          <p>Wendy's solo debut showcased her versatility with beautiful ballads and R&B tracks. Her album received critical acclaim and commercial success!</p>
        HTML
      },
      {
        title: "Joy: The Bubbly Lead Rapper and Vocalist",
        content: <<-HTML
          <h2>Park Soo-young (Joy) - Red Velvet's Happy Virus</h2>
          <p>Joy, born on September 3, 1996, is known for her bright personality, charming vocals, and acting skills. She's the mood maker of the group who brings energy and positivity.</p>
          
          <h3>Musical Contributions</h3>
          <p>As a lead rapper and vocalist, Joy adds a unique color to Red Velvet's music. Her sweet tone complements the group's harmonies perfectly, and her rap verses are always catchy.</p>
          
          <h3>Acting Career</h3>
          <p>Joy has successfully ventured into acting with roles in K-dramas like "The Liar and His Lover" and "Tempted." Her acting has received positive reviews and opened new opportunities.</p>
          
          <h3>Solo Music: "Hello"</h3>
          <p>Her remake album "Hello" showcased her ability to reinterpret classic songs with her own style. The project was a commercial and critical success!</p>
        HTML
      },
      {
        title: "Yeri: The Maknae Who Completes Red Velvet",
        content: <<-HTML
          <h2>Kim Ye-rim (Yeri) - Red Velvet's Youngest Member</h2>
          <p>Yeri, born on March 5, 1999, joined Red Velvet in 2015 as the fifth member. As the maknae (youngest), she brings youthful energy and has grown tremendously as an artist.</p>
          
          <h3>Growth as an Artist</h3>
          <p>Yeri joined after Red Velvet's debut, which was initially challenging. However, she proved herself with hard work and dedication, earning respect from fans and members alike.</p>
          
          <h3>Multi-talented Maknae</h3>
          <p>Beyond singing and dancing, Yeri has hosted radio shows, acted in web dramas, and showcased her variety show skills. She's also involved in songwriting and production.</p>
          
          <h3>Fashion and Influence</h3>
          <p>Yeri is known for her unique fashion sense and has become a trendsetter in Korea. She's also active on social media, connecting directly with fans!</p>
        HTML
      },
      {
        title: "Red Velvet's Debut: 'Happiness' and Their Journey Begins",
        content: <<-HTML
          <h2>The Start of Something Special</h2>
          <p>On August 1, 2014, Red Velvet debuted with "Happiness," introducing a fresh and energetic concept to the K-pop scene. The debut featured four members: Irene, Seulgi, Wendy, and Joy.</p>
          
          <h3>The Song That Started It All</h3>
          <p>"Happiness" was a vibrant summer track that perfectly introduced Red Velvet's "Red" concept. The colorful music video and catchy choreography made an immediate impact.</p>
          
          <h3>Initial Reception</h3>
          <p>While the debut received mixed reactions initially, Red Velvet quickly won over fans with their unique sound and concept. Their fresh approach to K-pop stood out in the crowded market.</p>
          
          <h3>Adding Yeri</h3>
          <p>In March 2015, SM Entertainment surprised fans by adding Yeri as the fifth member. This completed the group's lineup and strengthened their performance dynamics!</p>
        HTML
      },
      {
        title: "'Ice Cream Cake': Red Velvet's First Major Hit",
        content: <<-HTML
          <h2>The Song That Changed Everything</h2>
          <p>"Ice Cream Cake," released in March 2015, was Red Velvet's first major commercial success. The song showcased their maturity while maintaining the fun "Red" concept.</p>
          
          <h3>Musical Innovation</h3>
          <p>The track blended pop, R&B, and hip-hop elements, creating a unique sound that became Red Velvet's signature. The production was sophisticated yet accessible.</p>
          
          <h3>Iconic Choreography</h3>
          <p>The choreography for "Ice Cream Cake" became instantly iconic, with the point move being mimicked by fans worldwide. Seulgi's center moments were particularly memorable.</p>
          
          <h3>Commercial Success</h3>
          <p>The song topped charts and helped Red Velvet win their first music show awards. It established them as a top-tier girl group in the competitive K-pop industry!</p>
        HTML
      },
      {
        title: "'Dumb Dumb': Red Velvet's Quirky Masterpiece",
        content: <<-HTML
          <h2>Embracing the Weird and Wonderful</h2>
          <p>"Dumb Dumb," released in September 2015, pushed Red Velvet's "Red" concept to new creative heights. The song's quirky production and bizarre music video became instant classics.</p>
          
          <h3>Experimental Sound</h3>
          <p>The track featured unconventional sound effects, layered vocals, and unexpected production choices. It was bold, weird, and absolutely brilliant.</p>
          
          <h3>The Music Video</h3>
          <p>The surreal music video featured strange laboratory settings, quirky props, and colorful aesthetics. Each viewing revealed new details and easter eggs for fans to discover.</p>
          
          <h3>Critical Acclaim</h3>
          <p>"Dumb Dumb" received praise for its experimental nature and showed that Red Velvet wasn't afraid to take risks. It's now considered a K-pop classic!</p>
        HTML
      },
      {
        title: "'Russian Roulette': Red Velvet's Dark Humor",
        content: <<-HTML
          <h2>When Cute Meets Dark</h2>
          <p>"Russian Roulette," released in September 2016, showcased Red Velvet's ability to blend cute concepts with dark themes. The song's upbeat melody contrasted with lyrics about danger and risk.</p>
          
          <h3>The Concept Explained</h3>
          <p>The music video featured the members trying to eliminate each other in various "accidents" - all while maintaining their bright, cheerful demeanor. This juxtaposition became a signature Red Velvet style.</p>
          
          <h3>Catchy Melody</h3>
          <p>The song's whistle hook became one of the most memorable in K-pop. It's impossible not to sing along when you hear "La la la la la la la la!"</p>
          
          <h3>Fashion and Aesthetics</h3>
          <p>The styling featured retro-inspired outfits with bright colors, further emphasizing the contrast between the cheerful visuals and darker themes!</p>
        HTML
      },
      {
        title: "'Rookie': Red Velvet's Controversial But Catchy Hit",
        content: <<-HTML
          <h2>The Song That Divided Fans</h2>
          <p>"Rookie," released in February 2017, was one of Red Velvet's most controversial releases. The repetitive lyrics and unusual production split opinions, but the song became a massive hit.</p>
          
          <h3>The "Rookie Rookie" Debate</h3>
          <p>The song's main hook consists of the word "rookie" repeated numerous times. While some found it annoying, others found it incredibly catchy and addictive.</p>
          
          <h3>Complex Production</h3>
          <p>Beneath the repetitive lyrics lies sophisticated production with multiple layers, tempo changes, and genre blending. It rewards repeated listens.</p>
          
          <h3>Commercial Success</h3>
          <p>Despite the controversy, "Rookie" achieved significant commercial success and won multiple music show awards. It proved Red Velvet could succeed with experimental sounds!</p>
        HTML
      },
      {
        title: "'Red Flavor': The Ultimate Summer Anthem",
        content: <<-HTML
          <h2>Red Velvet's Perfect Summer Song</h2>
          <p>"Red Flavor," released in July 2017, is widely considered one of the best summer songs in K-pop history. The tropical-house influenced track captured the essence of summer perfectly.</p>
          
          <h3>Musical Perfection</h3>
          <p>The song features infectious melodies, tropical beats, and perfect vocal arrangements. Every element works together to create an irresistible summer vibe.</p>
          
          <h3>The Iconic Music Video</h3>
          <p>Filmed on a beach with bright, vibrant colors, the music video is quintessential summer. The members' styling, the aesthetics, and the choreography all screamed summer fun.</p>
          
          <h3>Career-Defining Success</h3>
          <p>"Red Flavor" became one of Red Velvet's biggest hits and is often cited as their signature song. It won numerous awards and remains a fan favorite years later!</p>
        HTML
      },
      {
        title: "'Peek-A-Boo': The Perfect Halloween Concept",
        content: <<-HTML
          <h2>Red Velvet Goes Dark</h2>
          <p>"Peek-A-Boo," released in November 2017, showcased Red Velvet's darker side with a horror-themed concept. The members played serial killers in the music video, delivering pizza and chaos.</p>
          
          <h3>The Pizza Delivery Horror Story</h3>
          <p>The music video tells the story of the members as seemingly innocent pizza delivery girls who are actually dangerous. The plot twist and dark humor became iconic.</p>
          
          <h3>Musical Elements</h3>
          <p>The song combines cute melodies with eerie production elements. The "peek-a-boo" hook is both playful and unsettling, perfectly matching the concept.</p>
          
          <h3>Fashion and Styling</h3>
          <p>The retro-inspired outfits with dark undertones created a unique aesthetic. The styling perfectly balanced cute and creepy elements!</p>
        HTML
      },
      {
        title: "'Bad Boy': Red Velvet's R&B Masterpiece",
        content: <<-HTML
          <h2>The Song That Proved Their Versatility</h2>
          <p>"Bad Boy," released in January 2018, marked Red Velvet's first full embrace of the "Velvet" concept for a title track. The mature R&B song became their most successful release in the West.</p>
          
          <h3>Musical Sophistication</h3>
          <p>The track features smooth R&B production, sultry vocals, and a chill vibe that was different from their previous releases. It showcased their vocal abilities perfectly.</p>
          
          <h3>International Success</h3>
          <p>"Bad Boy" charted on Billboard and introduced Red Velvet to many international fans. The English version further expanded their global reach.</p>
          
          <h3>The Elegant Concept</h3>
          <p>The music video featured luxurious settings, elegant styling, and mature choreography. It proved Red Velvet could pull off any concept with perfection!</p>
        HTML
      },
      {
        title: "'Power Up': The Most Fun Summer Song",
        content: <<-HTML
          <h2>Gaming Concept Meets Summer Vibes</h2>
          <p>"Power Up," released in August 2018, combined retro gaming aesthetics with summer vibes. The 8-bit inspired sounds and colorful concept made it instantly memorable.</p>
          
          <h3>The Gaming Theme</h3>
          <p>The music video featured arcade game aesthetics, pixel art elements, and the members dressed in colorful, playful outfits. The concept was fresh and fun.</p>
          
          <h3>Infectious Melody</h3>
          <p>The song's main hook "Power power power power up!" became one of the catchiest choruses in K-pop. It's impossible not to sing along.</p>
          
          <h3>Summer Perfection</h3>
          <p>Like "Red Flavor" before it, "Power Up" captured the essence of summer. The upbeat energy and bright visuals made it a perfect summer anthem!</p>
        HTML
      },
      {
        title: "'RBB (Really Bad Boy)': The Unexpected Sequel",
        content: <<-HTML
          <h2>When Red Velvet Gets Fierce</h2>
          <p>"RBB (Really Bad Boy)," released in November 2018, was a surprising follow-up to "Bad Boy" with a completely different vibe. The fierce, aggressive concept showed a new side of the group.</p>
          
          <h3>The Animal Theme</h3>
          <p>The music video featured animal print, fierce styling, and bold choreography. The members channeled powerful, untamed energy throughout the performance.</p>
          
          <h3>Unexpected Sound</h3>
          <p>The song combined EDM, trap, and pop elements with aggressive production. It was unlike anything Red Velvet had released before, showing their willingness to experiment.</p>
          
          <h3>Divided Reactions</h3>
          <p>While some fans loved the bold new direction, others preferred their previous sounds. Regardless, it showcased Red Velvet's artistic courage!</p>
        HTML
      },
      {
        title: "'Zimzalabim': Red Velvet's Most Experimental Title Track",
        content: <<-HTML
          <h2>The Song That Broke the Internet</h2>
          <p>"Zimzalabim," released in June 2019, became one of the most talked-about K-pop releases of the year. Its experimental production and bizarre concept sparked endless discussions.</p>
          
          <h3>Musical Experimentation</h3>
          <p>The track features multiple genre shifts, unconventional structure, and the now-famous "zimzalabim" chant. It's chaotic, weird, and brilliant.</p>
          
          <h3>The Circus Concept</h3>
          <p>The music video featured circus aesthetics with surreal, trippy visuals. Each member had unique styling that added to the chaotic but cohesive concept.</p>
          
          <h3>Meme Culture</h3>
          <p>The song became a meme, with the "zimzalabim" hook being used in countless online content. Whether intentional or not, it became a cultural phenomenon!</p>
        HTML
      },
      {
        title: "'Umpah Umpah': The Festival Concept",
        content: <<-HTML
          <h2>Red Velvet's Beach Party</h2>
          <p>"Umpah Umpah," released in August 2019, was a celebration of summer with festival vibes. The reggae-influenced track and beach party concept created the perfect summer mood.</p>
          
          <h3>The Festival Aesthetic</h3>
          <p>The music video featured beach settings, festival wear, and carefree summer vibes. The members looked like they were genuinely having fun, which translated to the viewers.</p>
          
          <h3>Musical Elements</h3>
          <p>The reggae-pop fusion with the repetitive "umpah umpah" hook created an instantly catchy summer anthem. The production was bright and energetic.</p>
          
          <h3>Last Summer Song</h3>
          <p>This marked Red Velvet's final summer comeback before their hiatus, making it especially nostalgic for fans. It ended an era of legendary summer songs!</p>
        HTML
      },
      {
        title: "'Psycho': Red Velvet's Magnum Opus",
        content: <<-HTML
          <h2>The Song That Defined Red Velvet</h2>
          <p>"Psycho," released in December 2019, is widely considered Red Velvet's best song. The mature R&B track combined perfect vocals, emotional depth, and sophisticated production.</p>
          
          <h3>Musical Excellence</h3>
          <p>The song features complex vocal arrangements, emotional delivery, and production that rewards repeated listens. Every member shines in their parts.</p>
          
          <h3>The Elegant Concept</h3>
          <p>The music video showcased elegant styling, cinematic visuals, and mature choreography. It was Red Velvet at their most refined and sophisticated.</p>
          
          <h3>Record-Breaking Success</h3>
          <p>"Psycho" became Red Velvet's biggest hit, charting for months and winning numerous awards. It's considered a K-pop masterpiece and their signature "Velvet" song!</p>
        HTML
      },
      {
        title: "'Queendom': The Return of Red Velvet",
        content: <<-HTML
          <h2>Red Velvet's Triumphant Comeback</h2>
          <p>"Queendom," released in August 2021, marked Red Velvet's return after a long hiatus. The uplifting song celebrated summer and their royal status in K-pop.</p>
          
          <h3>The Comeback Story</h3>
          <p>After nearly two years without group activities due to various circumstances, Red Velvet's return was highly anticipated. "Queendom" delivered exactly what fans needed.</p>
          
          <h3>Summer Vibes</h3>
          <p>The disco-influenced track brought back the bright, energetic "Red" concept that fans loved. The song was a celebration of summer and their return.</p>
          
          <h3>Fan Response</h3>
          <p>ReVeluvs (Red Velvet fans) celebrated the comeback with massive support. The song's message about being queens resonated with both the members and fans!</p>
        HTML
      },
      {
        title: "'Feel My Rhythm': Classical Meets K-pop",
        content: <<-HTML
          <h2>Bach Meets Red Velvet</h2>
          <p>"Feel My Rhythm," released in March 2022, sampled Bach's "Air on the G String," creating a unique fusion of classical music and K-pop. The result was magical.</p>
          
          <h3>The Classical Sample</h3>
          <p>Using Bach's famous piece as the foundation, Red Velvet created something entirely new. The combination of classical strings with modern pop production was genius.</p>
          
          <h3>Spring Concept</h3>
          <p>The music video featured beautiful spring aesthetics with cherry blossoms, elegant dresses, and fairy-tale visuals. It was visually stunning and perfectly matched the music.</p>
          
          <h3>Critical and Commercial Success</h3>
          <p>The song topped charts and received critical acclaim for its innovative approach. It proved Red Velvet could master any genre!</p>
        HTML
      },
      {
        title: "'Birthday': The Party Anthem",
        content: <<-HTML
          <h2>Red Velvet's Celebration</h2>
          <p>"Birthday," released in November 2022, was a high-energy dance track that celebrated life and happiness. The funky, disco-influenced song was pure joy.</p>
          
          <h3>The Party Concept</h3>
          <p>The music video featured party settings, colorful styling, and energetic choreography. Everything about it screamed celebration and good times.</p>
          
          <h3>Musical Style</h3>
          <p>The disco-funk influences, combined with Red Velvet's signature sound, created an irresistible party track. The production was polished and dance-friendly.</p>
          
          <h3>Choreography</h3>
          <p>The powerful, synchronized choreography showcased Red Velvet's dancing abilities. Seulgi, as always, shined in every movement!</p>
        HTML
      },
      {
        title: "Red Velvet's B-Sides: Hidden Gems You Need to Hear",
        content: <<-HTML
          <h2>Beyond the Title Tracks</h2>
          <p>While Red Velvet's title tracks are amazing, their B-sides are equally impressive. Here are some must-listen tracks that showcase their versatility.</p>
          
          <h3>Essential B-Sides</h3>
          <ul>
            <li><strong>Kingdom Come</strong> - A dreamy, atmospheric masterpiece</li>
            <li><strong>You Better Know</strong> - Funky and addictive</li>
            <li><strong>Sunny Side Up!</strong> - The perfect feel-good song</li>
            <li><strong>Blue Lemonade</strong> - Smooth R&B perfection</li>
            <li><strong>Body Talk</strong> - Sultry and sophisticated</li>
          </ul>
          
          <h3>Deep Cuts Worth Exploring</h3>
          <p>Tracks like "Talk To Me," "Look," and "In & Out" show Red Velvet's range. Each album is filled with quality songs that could be title tracks.</p>
          
          <p>Don't sleep on Red Velvet's B-sides - they're often the best part of the albums!</p>
        HTML
      },
      {
        title: "Red Velvet's Impact on K-pop Fashion and Trends",
        content: <<-HTML
          <h2>Trendsetters of K-pop</h2>
          <p>Red Velvet has significantly influenced K-pop fashion and trends since their debut. Their styling choices often set trends that other groups follow.</p>
          
          <h3>Iconic Fashion Moments</h3>
          <p>From the velvet outfits in "Psycho" to the retro looks in "Peek-A-Boo," Red Velvet's styling is always on point. Each comeback brings fresh fashion inspiration.</p>
          
          <h3>Individual Style</h3>
          <p>Each member has developed their unique fashion sense. Yeri's street style, Irene's elegant looks, and Joy's feminine style all influence fashion trends.</p>
          
          <h3>Beauty Trends</h3>
          <p>Red Velvet's makeup and hair styles often go viral. Their "Psycho" era makeup and "Red Flavor" summer looks became widely imitated!</p>
        HTML
      },
      {
        title: "Red Velvet's Concert Experience: A Fan's Perspective",
        content: <<-HTML
          <h2>Experiencing Red Velvet Live</h2>
          <p>Red Velvet's concerts are unforgettable experiences that showcase their talents, stage presence, and connection with fans. Here's what makes their concerts special.</p>
          
          <h3>Vocal Excellence</h3>
          <p>Red Velvet is known for their stable live vocals. Despite complex choreography, they deliver near-perfect performances. Wendy's high notes always impress!</p>
          
          <h3>Stage Presence</h3>
          <p>Each member commands attention with their unique charisma. Seulgi's dancing, Irene's expressions, Joy's energy, Wendy's vocals, and Yeri's charm create magic together.</p>
          
          <h3>Fan Interactions</h3>
          <p>The members genuinely connect with ReVeluvs during concerts. Their sincerity and appreciation for fans make every concert feel intimate despite the large venues!</p>
        HTML
      },
      {
        title: "ReVeluv: Understanding Red Velvet's Devoted Fandom",
        content: <<-HTML
          <h2>Meet the ReVeluvs</h2>
          <p>ReVeluv (Red Velvet + Love) is the official fandom name for Red Velvet fans. The dedicated fanbase has supported the group through every concept and challenge.</p>
          
          <h3>Fandom Culture</h3>
          <p>ReVeluvs are known for their creativity, producing fan art, covers, and analysis videos. They're also dedicated to streaming and supporting comebacks.</p>
          
          <h3>The Fan-Artist Relationship</h3>
          <p>Red Velvet maintains a close relationship with fans through fan meetings, social media, and personal messages. This connection has created a loyal, loving fanbase.</p>
          
          <h3>Supporting Through Challenges</h3>
          <p>During the group's hiatus and individual members' difficult times, ReVeluvs showed unwavering support. Their loyalty has helped Red Velvet overcome obstacles!</p>
        HTML
      }
    ]
    
    # Create posts with staggered dates
    posts_data.each_with_index do |post_data, index|
      # Spread posts over the last 50 days
      days_ago = 50 - (index * 2)
      
    post = user.posts.create!(
    title: post_data[:title],
    published_at: days_ago.days.ago + rand(0..23).hours,
    content: post_data[:content]  # Set content properly during creation
    )
      
      puts "✓ Created: #{post.title}"
    end
    
    puts "\n🎉 Successfully created #{posts_data.length} Red Velvet blog posts!"
    puts "📊 Total posts: #{Post.count}"
    puts "\n💡 These posts cover Red Velvet's entire discography and member profiles!"
    puts "🖼️  Posts will show gradient placeholders - you can add Red Velvet images manually later!"
  end
end
