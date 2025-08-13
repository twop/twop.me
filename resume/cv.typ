// For more customizable options, please refer to official reference: https://typst.app/docs/reference/

// #import "@preview/fontawesome:0.6.0": *

// Nord theme colors: https://www.nordtheme.com/docs/colors-and-palettes
#let nord_blue = rgb("#5e81ac") // Nord10 - for links
#let nord_secondary = rgb("#3b4252") // Nord1 - dark gray
#let nord0 = rgb("#2e3440") // Nord0 - darkest gray for headers

#show heading.where(level: 1): set text(font: "Inter", fill: nord0)
#show heading.where(level: 2): set text(font: "Inter", fill: nord0)

#set text(font: "Inter")

#show link: set text(fill: nord_blue)
#show link: underline

// Uncomment the following lines to adjust the size of text
// The recommend resume text size is from `10pt` to `12pt`
#set text(
 size: 11pt,
)

// Feel free to change the margin below to best fit your own CV
#set page(
  margin: (x: 0.9cm, y: 1.3cm),
)


#set par(justify: true)

#let chiline() = { v(-3pt); line(length: 100%); v(-5pt) }

#let continuescvpage() = {
  place(
    bottom + center,
    dx: 0pt,        // Horizontal offset (positive is rightward)
    dy: -10pt,      // Vertical offset (positive moves upwards)
    float: true,
    scope: "parent",
    [
      #text(fill: gray)[... continues on the next page ...]
    ]
  )
}

#let lastupdated(date) = {
  h(1fr); text("Last Updated in " + date, fill: color.gray)
}

#let space_lg() = {v(8pt)}
#let space_md() = {v(7pt)}
#let job_title(title) = {text(font: "JetBrainsMono NF", size: 10pt, style:"italic", weight: "extrabold", fill: nord0)[#title]}
#let company_info(company, dates) = {text(font: "JetBrainsMono NF", size: 10pt, weight: "extrabold", fill: nord0)[#company] + text(size: 10pt, fill: nord_secondary)[#h(1fr) #dates]}
#let technologies(tech_list) = {text(size: 10pt, style: "italic", fill: nord_secondary)[Technologies: #tech_list.join(", ")]}
#let job_header(title, company, dates) = {
  job_title(title) + [, ] + company_info(company, dates)
}
#let job_tagline(description) = {text(style: "italic")[#description]}

// Uncomment the following lines to add the optional prompt at the bottom of the first CV page
// #continuescvpage()

= Simon Korzunov

#text(size: 10pt)[
// #fa-envelope() 
twop\@hey.com |
// #fa-github() 
#link("https://github.com/twop")[github.com/twop] | 
// #fa-linkedin() 
#link("https://www.linkedin.com/in/skorzunov")[linkedin.com/in/skorzunov]
]

I enjoy working on hard engineering challenges that require cross-team collaboration, especially if I can make things run faster and more reliable with Rust and WASM.

#space_md()

== Experience
#chiline()
#space_lg()

#job_header("Software Engineer", "Topologic", "Aug 2024 - Aug 2025") \
#job_tagline("Software for design and automation of industrial knitting")

- Vector graphics editor to design garment outlines using Rust + egui
- Compiler from vector outline to machine instructions for knitting using Rust + TypeScript
- Physics simulation for yarn topology relaxation, real-time 60fps with 20,000+ nodes/stitches using WASM + Rust
- Control system software for CAN device network using Python
- Domain-specific language to control motors, I/O boards, manifolds in partnership with mechanical engineers
- VM/interpreter for that language with pausing, introspection and REPL support
#technologies(("Rust", "WASM", "WebGL", "egui", "Python", "CANopen", "TypeScript"))

#space_md()

#job_header("Software Engineer", "Pomelo Inc", "May 2023 - July 2024") \
#job_tagline("FinTech B2C startup: mentoring, technical strategy and roadmap for Web, Mobile and Backend teams")

- Design System that works both on React Native and web, deprecated existing react-native-web solution
- Workshops on Rust, React state management, state machines and advanced TypeScript
- Planned, prototyped, scoped and started migration to Rust/GraphQL/Axum on BE from REST/Java stack using BFF architecture
- Planned technical expansion of the product to Mexico

#technologies(("Rust", "Axum", "React", "React Native", "TypeScript", "GraphQL"))

#space_md()

#job_header("Software Engineer", "Okta, OktaX incubation program", "Nov 2021 - Feb 2023") \
#job_tagline("IAM Pulse - AWS IAM permission graph analysis and visualization for IAC")

- Rust/WASM graph visualization engine
- Layout engine with Taffy, text rendering with SDF, hit test detection for declarative UI framework with vdom
- Custom Terraform language parser and interpreter in Rust

#technologies(("Rust", "WebGL", "WebAssembly"))

#space_md()

#job_header("Software Engineer", "Next Music", "Aug 2020 - Feb 2021") \
#job_tagline("React Native and React Web versions of sessionslive.com music streaming app")

- Client side technical strategy and architecture
- Workshops on JS performance and React internals
- Reduced app bundle size from 7.5MB to 1.4MB
- Measured TTI and cut it down by 70% on several screens
- Introduced "Over the Air" updates for the mobile app
- Transition to GraphQL on the client

#technologies(("TypeScript", "React", "React Native", "GraphQL"))

#space_md()

#job_header("Senior Software Engineer", "Dropbox", "Oct 2018 - Apr 2020") \
#job_tagline("Desktop UI Platform - Platform for developing UI using web technologies")

- JavaScript build pipeline for new Dropbox desktop app
- JavaScript performance: build time and run time optimizations
- Building and integrating tools to measure performance
- Internal React/Redux/JS/performance consulting and workshops

#technologies(("TypeScript", "React", "Webpack", "V8"))

#space_md()

#job_header("Senior Software Engineer", "Microsoft", "Jul 2015 - Oct 2018") \
#job_tagline("Internal incubation project")
- Internal incubation project - Hackathon project that grew into a 1-year incubation effort: exploring AR applications in office environments (React Native)

#job_tagline("Transport for MS 365 Office cloud")
- Precise queue delivery scheduling on cloud nodes for emails and other packets
- Hotswap framework for extracting sensitive content

#technologies(("TypeScript", "React", "React Native", "Redux", "C#", "C++"))

#space_md()

#job_header("Senior Software Engineer", "EastBanc Technologies", "Oct 2013 - Jun 2015") \
#job_tagline("Washington Area Transit Authority internal automation tools")

- Creating and moving existing kiosk and desktop applications to web-based solutions

#technologies(("ASP.NET MVC", "JavaScript"))

#space_md()

#job_header("Senior Software Engineer -> Software Lead", "Nival", "Jan 2010 - Sep 2013") \
#job_tagline("Prime World - Dota-like, Role-playing strategy game")

- Led small team responsible for building in-game UI framework and content
- Game logic: Pathfinding, AI development using C++
- Reverse engineered Adobe Flash Player ActionScript 3 internal API
- Custom Flash player based on Tamarin virtual machine
- Custom UI framework based on Flash on Unity3d
- In-game chat system based on IRC protocol on top of HTTP

#technologies(("C#", "C++", "ActionScript 3", "Unity3d", "Flash", "Tamarin"))

#space_md()

#job_header("Software Engineer", "SoftLab Nsk", "Aug 2009 - Jan 2010") \
#job_tagline("HardTruck 3 - Truck driving simulator game")

- Environmental audio support with OpenAL

#technologies(("C++", "OpenAL", "DirectSound", "DirectX", "COM"))

#space_md()

#job_header("Software Engineer", "DataWorks", "Oct 2006 - Aug 2009") \

- Writing test harness for the rendering engine for reports written in C, which is primarily 13 "goto" 20000 lines function

#technologies(("Flex", "Flash", "ActionScript 3", "C#", "NAnt", "OLAP", "C++", "COM", "ActiveX"))

#space_lg()

== Education
#chiline()
#space_lg()

#company_info("Novosibirsk State University", "Aug 2009 - Jan 2010") \
#job_tagline([Bachelor of Science in Physics #h(1fr) Novosibirsk, Russia])

- Physic-technical Research Automation Department
- Graduation thesis: «Design of an efficient algorithm for multidimensional data indexing»

