// ===========================
// Resume of Alberto Sebastian Hernandez
// ===========================

// ── Page setup ──────────────────────────────────────────────────────────────
#set page(
  paper: "us-letter",
  margin: (x: 0.5in, y: 0.2in),
)
#set text(size: 10pt)
#set par(leading: 0.4em)

// ── Contact info ─────────────────────────────────────────────────────────────
#let my-email   = sys.inputs.at("EMAIL", default: "[REDACTED]")
#let my-phone   = sys.inputs.at("PHONE_NUMBER", default: "[REDACTED]")
#let my-linkedin = sys.inputs.at("LINKEDIN", default: "[REDACTED]")
#let my-github = sys.inputs.at("GITHUB", default: "[REDACTED]")

// ============================================================
// UI FUNCTIONS
// ============================================================

/// Section header with small-caps label and a full-width rule below.
#let section(title) = {
  pad(top: -2pt)[
    #{
      text(size: 12pt, weight: "bold")[#smallcaps(title)]
      v(-10pt)
      line(length: 100%, stroke: 0.6pt)
    }
  ]
}

/// Two-line subheading: bold title + date on the first row,
/// italic subtitle + location on the second row.
///   #subheading("Company", "Date", "Role", "City, ST")
#let subheading(org, date, role, loc) = {
  pad(top: -6pt)[
    #block(width: 100%)[
      #text(weight: "bold", size: 10pt)[#org]
      #h(1fr)
      #text(size: 10pt)[#date]
    ]
  ]
  
  pad(top: -6pt, bottom: -4pt)[
    #block(width: 100%)[
      #text(style: "italic", size: 9pt)[#role]
      #h(1fr)
      #text(style: "italic", size: 9pt)[#loc]
    ]
  ]

}

/// Project heading: bold name | tag | tag  ···  date
///   #project-heading("FIUJudge", ("Contest Environment", "Hybrid"), "June 2025 – Present")
#let project-heading(name, tags, date) = {
  pad(top: -6pt, bottom: -4pt)[
    #grid(
      columns: (1fr, auto),
      {
        text(weight: "bold")[#name]
        for t in tags { text[ $|$ #t] }
      },
      text[#date],
    )
  ]
  // v(-2pt)
}

/// Bulleted list of resume items with consistent small size & spacing.
#let items(..bullets) = {
  // set text(size: 8.5pt)
  set list(indent: 1em, body-indent: 0.4em, spacing: 4pt)
  pad(top: -2pt)[#list(..bullets.pos().map(b => b))]
  v(-1pt)
}

// ============================================================
// HEADER
// ============================================================
#import "@preview/fontawesome:0.5.0": *
#align(center)[
  #text(size: 18pt, weight: "bold")[#smallcaps[Alberto Sebastian Hernandez]] \
  #text(size: 9pt)[
    #fa-icon("phone") #my-phone #h(6pt) | #h(6pt)
    #fa-icon("envelope") #my-email #h(6pt) | #h(6pt)
    #fa-icon("linkedin") #link(my-linkedin)[#my-linkedin] #h(6pt) | #h(6pt)
    #fa-icon("github") #link(my-github)[#my-github]
  ]
]

// ============================================================
// EDUCATION
// ============================================================

#section("Education")

#subheading(
  "Florida International University",
  "Aug. 2023 - Dec. 2026",
  "Bachelor's in Computer Science",
  "Miami, FL",
)
#items(
  [*Relevant coursework*: Data Structures, Algorithm Techniques, Systems Programming, Software Engineering],
)

// ============================================================
// EXPERIENCE
// ============================================================

#section("Experience")

#subheading("FEAM Aero", "Sep. 2025 - Present", "Software Engineering Intern", "Miami Lakes, FL")
#items(
  [Delivered *15-20 tickets* across *full-stack* features and bug fixes on a platform serving *1,500+ clients*, working across a legacy (*C\#*, *React*, *TypeScript*) and modern (*React*, *Tailwind*, *Node.js*, *Python*) codebase managed via *Azure DevOps*.],
  [Modernized and refactored legacy software features, improving application performance by *10-20%* and enhancing long-term maintainability across a large-scale management platform.],
  [Built and maintained *REST API* integrations using *Microsoft SQL Server* to fetch and manage operational data including mechanic work hours, fuel usage, and aircraft service records.],
)

#subheading("UKG", "Sep. 2024 - Dec. 2024", "Software Engineering Intern", "Weston, FL")
#items(
  [Contributed to a *Microsoft Dynamics 365* webapp serving *80,000+ clients* by resolving backend tickets via *Azure DevOps*, using *C\#*, *Microsoft SQL Server*, and internal *REST APIs* to fix bugs, improve automation, and enhance performance.],
  [Independently designed and developed a *full-stack* internal email automation tool using *X++*, enabling team members to assign automated actions to emails and receive real-time pass/fail notifications, reducing manual workload for the team.],
  [Improved overall engineering team efficiency *10%* through backend optimizations and delivering tooling that streamlined repetitive financial workflows within *Microsoft Dynamics 365*.],
)

#subheading("Mercedes-Benz", "Aug. 2023 - Sep. 2024", "Systems/Network Analyst", "Coral Gables, FL")
#items(
  [Automated network-wide policy enforcement via *Microsoft PowerShell* scripting, reducing manual IT workload by approximately *30%* and streamlining compliance across *250+ endpoints*.],
  [Configured and maintained *switches*, *firewalls*, and *servers* for *250+ clients*, resolving *25+ tickets* per week alongside a sole IT Administrator to sustain network uptime.],
  [Managed user accounts in *Microsoft Active Directory* and provided *Azure* cloud support, enabling seamless onboarding and remote access for dealership staff and off-site customers.],
)

// ============================================================
// LEADERSHIP
// ============================================================

#section("Leadership")

#subheading(
  "Reach Project Manager", "Jan. 2026 - Present",
  "INIT FIU", "Miami, FL"
)
#items(
  [Led a team of *5 leads* to plan and deliver weekly technical workshops for *10-15 FIU students*, covering Data Structures & Algorithms curriculum and behavioral and technical interview preparation.],
  [Designed and standardized *Python and Java* DSA workshop curriculum across *10+ sessions*, contributing to measurably increased student attendance and positive feedback scores.],
  [Collaborated within a *20+ member executive board* to drive strategic decisions on club direction, contributing to the overall growth and vision of INIT FIU.]
)

// ============================================================
// PROJECTS
// ============================================================

#section("Projects")

#project-heading("Dr. Home D.O", ("Online Multiplayer Video Game", "Team of 3"), "Jan. 2026 - Present")
#items(
  [Contributing to a *full-stack* multiplayer top-down strategy and puzzle game in *C\#* and *Unity* with a team of *3 engineers*, leveraging adjacency graphs and node trees to drive dynamic gameplay and map logic.],
  [Integrated *Mirror networking* library to architect a stable peer-to-peer connection infrastructure, optimizing network synchronization and performance across all multiplayer clients.],
)

#project-heading("PrepBear", ("AI Mock Interview Website", "Team of 4", "ShellHacks 2025"), "Sep. 2025")
#items(
  [Integrated *Google Live API* *WebSocket*-based audio streaming in *TypeScript* and *Node.js* to enable real-time, voice interactions between users and an AI mock interviewer.],
  [Designed and implemented the AI mock interviewer interface using *React* and *TypeScript*, delivering an intuitive user experience for conducting live interview sessions.],
  [Leveraged the *Gemini 1.5 API* to dynamically simulate tailored interviews based on user-provided job title, company, and resume inputs, deployed and used by real users.]
)

#project-heading("StudyDen", ("AI Education Mobile App", "Team of 4"), "Feb. 2025 - Oct. 2025")
#items(
  [Developed *REST API* endpoints using *FastAPI*, *Node.js*, and *Python* to handle quiz generation workflows, integrating the *OpenAI API* to auto-generate personalized quizzes from learning materials provided by the user.],
  [Deployed and configured an *Ubuntu* server to host the project database, ensuring a stable backend for the full dev team.],
  [Built frontend features in *React Native* to scan/store textbooks, creating a seamless in-app content management experience.],
)

// ============================================================
// TECHNICAL SKILLS
// ============================================================

#section("Technical Skills")

#pad(top:-4pt)[
  #text[- *Languages*: JavaScript, TypeScript, C/C++, C\#, Python3, SQL
- *Libraries/Frameworks*: Node.js, React, React Native, Tailwind, ASP.NET, FastAPI, Pandas, PyTorch, Hugging Face, Transformers, Unity
- *Tools*: Git, Azure DevOps, Postman, DigitalOcean ]
]