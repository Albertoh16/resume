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
  [Delivered *15-20 tickets* across *full-stack* features and bug fixes on a platform serving *1,500+ clients*, working in an *Agile* environment across a legacy (*C\#*, *React*, *TypeScript*) and modern (*React*, *Tailwind*, *Node.js*, *Python*) codebase managed via *Azure DevOps*.],
  [Modernized and refactored legacy software features, improving application performance by *10-20%* and enhancing long-term maintainability across a large-scale management platform.],
  [Built and maintained *REST API* integrations using *Microsoft SQL Server* to fetch and manage operational data including mechanic work hours, fuel usage, and aircraft service records.],
)

#subheading("UKG", "Sep. 2024 - Dec. 2024", "Software Engineering Intern", "Weston, FL")
#items(
  [Contributed to a *Microsoft Dynamics 365* webapp serving *80,000+ clients* by resolving backend tickets in a *Scrum* environment via *Azure DevOps*, using *C\#*, *Microsoft SQL Server*, and internal *REST APIs* to fix bugs, improve automation, and enhance performance.],
  [Independently designed and developed a *full-stack* internal email automation tool using *X++*, enabling team members to assign automated actions to emails and receive real-time pass/fail notifications, reducing manual workload for the team.],
  [Improved overall engineering team efficiency *10%* through backend optimizations and delivering tooling that streamlined repetitive financial workflows within *Microsoft Dynamics 365*.],
)

#subheading("Mercedes-Benz", "Aug. 2023 - Sep. 2024", "Systems/Network Analyst", "Coral Gables, FL")
#items(
  [Automated network-wide configuration and compliance enforcement via *Microsoft PowerShell* scripting, reducing manual IT workload by *30%* across *250+ endpoints*.],
  [Administered *Azure* cloud infrastructure and *Microsoft Active Directory* for *250+ users*, enabling remote access and identity management across dealership operations.],
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
)

// ============================================================
// PROJECTS
// ============================================================

#section("Projects")

#project-heading("Job Posting Emailer", ("Automated Job Digest Service", "Full-Stack", "Solo"), "Mar. 2026 - Present")
#items(
  [Built a *Python* + *Playwright* pipeline that deduplicates and merges *Jobright* internship listings from *two JSON sources*, the *Next.js* page payload and intercepted *network responses*, with per-user *dynamic time-window filtering* and *concurrent* email dispatch via *asyncio*.],
  [Replaced *keyword matching* with an *ML* semantic similarity engine via *sentence-transformers* (*PyTorch*, *Hugging Face*) that *batch-encodes* job postings and user filters into *embeddings*, scoring inclusion and exclusion via *cosine similarity*, deployed on *GitHub Actions* *CI/CD* with *model caching*, serving *20+ active users*.],
)

#project-heading("PrepBear", ("AI Mock Interview Website", "Team of 4", "ShellHacks 2025"), "Sep. 2025")
#items(
  [Integrated *Google Live API* *WebSocket*-based audio streaming in *TypeScript* and *Node.js* to enable real-time voice interactions between users and an AI mock interviewer.],
  [Leveraged the *Gemini 1.5 API* to dynamically simulate tailored interviews based on user-provided job title, company, and resume inputs, presented to *8 companies* and used by *25+ users* at *ShellHacks 2025*.],
)

#project-heading("StudyDen", ("AI Education Mobile App", "Team of 4"), "Feb. 2025 - Oct. 2025")
#items(
  [Developed *REST API* endpoints using *FastAPI*, *Node.js*, and *Python* to handle quiz generation workflows, integrating the *OpenAI API* to auto-generate personalized quizzes from learning materials provided by the user.],
  [Deployed a *FastAPI* backend and *SQLite* database on a *DigitalOcean* *Ubuntu* server, providing a stable hosted *API* for the full dev team.],
  [Built a *React Native* camera pipeline using *Pytesseract* *OCR* to extract and store textbook text in a *SQLite* database, fetched on-demand via *FastAPI*.],
)

// ============================================================
// TECHNICAL SKILLS
// ============================================================

#section("Technical Skills")

#pad(top:-4pt)[
  #text[- *Languages*: JavaScript, TypeScript, C/C++, C\#, Python3, SQL
- *Libraries/Frameworks*: Node.js, React, React Native, Tailwind, ASP.NET, FastAPI, Pandas, PyTorch, Hugging Face, Transformers, Playwright, Unity
- *Tools*: Git, GitHub Actions, Azure DevOps, Postman, DigitalOcean ]
]