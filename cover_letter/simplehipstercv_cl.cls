
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{simplehipstercv_cl}[2019/06/22 A New Simple CV Template]

\LoadClass[letterpaper]{article}
\RequirePackage{academicons}
\RequirePackage[english]{babel}
\RequirePackage[utf8]{luainputenc}
\RequirePackage{fontspec} 					                 % for loading fonts
\RequirePackage{url,parskip} 	    % other packages for formatting
\RequirePackage[usenames,dvipsnames]{xcolor}
\RequirePackage{fullpage}
\RequirePackage[margin=1.75cm, top=1.5cm, bottom=1.5cm]{geometry}
\RequirePackage[fixed]{fontawesome5}
\RequirePackage{titlesec}
\RequirePackage{array}
\RequirePackage{enumitem}
\RequirePackage{longtable}
\RequirePackage{etoolbox}
\RequirePackage{tikz}
\RequirePackage[skins]{tcolorbox}
\RequirePackage{fancyhdr}
\RequirePackage{ifthen}
\RequirePackage[default]{raleway}

% Setup fancyhdr package
\fancyhf{}
\fancyhfoffset{0em}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
\pagestyle{fancy}


\definecolor{headercolour}{rgb}{0.25,0.25,0.25}
%-------------------------------------------------------
\definecolor{materialpurple}{HTML}{9C27B0}
\definecolor{materialindigo}{HTML}{3F51B5}
\definecolor{materialblue}{HTML}{2196F3}
\definecolor{materialcyan}{HTML}{00BCD4}
\definecolor{materialteal}{HTML}{009688}
\definecolor{materialgreen}{HTML}{4CAF50}
\definecolor{materiallime}{HTML}{CDDC39}
\definecolor{materialamber}{HTML}{FFC107}
\definecolor{materialbrown}{HTML}{795548}
\definecolor{materialred}{HTML}{FF4436}
\definecolor{materialorange}{HTML}{FF5722}
\definecolor{pblue}{HTML}{0395DE}
\newcommand{\iconsize}{\huge}

% ---------------------------------------------------------------------------

% Farben
\definecolor{headerblue}{HTML}{2EB6E1}%
\definecolor{cvorange}{HTML}{FFC300}
\definecolor{cvpurple}{HTML}{B32EE1}
\definecolor{cvred}{HTML}{E1592E}
\definecolor{cvgreen}{HTML}{5DE12E}
\colorlet{cvgreen}{headerblue}
\colorlet{cvpurple}{cvred}

\newcommand{\setasidefontcolour}{
\color{black}
}
\definecolor{labelcolour}{HTML}{000000}
\definecolor{iconcolour}{HTML}{000000}
\definecolor{headerfontbox}{HTML}{000000}
\definecolor{headerfontboxfont}{HTML}{FFFFFF}
\definecolor{skilllabelcolour}{HTML}{b3b3b3}

% Actually just use these colors
\definecolor{linkcolor}{HTML}{436cc9}
% \colorlet{linkcolor}{materialblue}
\colorlet{accentcolor}{black!70}
\colorlet{symbolcolor}{black!60}


% ---------------------------------------------------------------------------

% Font Awesome icons aliases
\newcommand{\mailSymbol}{\faAt}
\newcommand{\locationSymbol}{\faMapMarker*}
\newcommand{\infoSymbol}{\faInfo}
\newcommand{\linkedinSymbol}{\faLinkedinIn}
\newcommand{\RGSymbol}{\aiResearchGate}
\newcommand{\GSSymbol}{\aiGoogleScholar}
\newcommand{\viadeoSymbol}{\faViadeo}
\newcommand{\ThesisSymbol}{\faGraduationCap}
\newcommand{\mobileSymbol}{\faMobile*}
\newcommand{\githubSymbol}{\faGithub}
\newcommand{\stackoverflowSymbol}{\faStackOverflow}
\newcommand{\stackexchangeSymbol}{\faStackExchange}
\newcommand{\mediumSymbol}{\faMedium}
\newcommand{\bitbucketSymbol}{\faBitbucket}
\newcommand{\websiteSymbol}{\faLink}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\link[2]{\color{linkcolor}\href{#1}{#2}\color{Black} }
\newcommand\important[1]{\textbf #1}

% Render author's name
% Usage: \user{<firstanme>}{<lastname>}
\newcommand\user[2]{\color{accentcolor}{\LARGE #1 \textsc{\textbf{#2}}}\color{Black}}

% Render a text with its symbol
% Usage; \socialtext{<icon>}{<label>}
\newcommand{\socialtext}[2]{\mbox{\textcolor{symbolcolor}{#1}#2\hspace{0.8em}}}

% Render a link with its symbol
% Usage; \sociallink{<icon>}{<label>}
\newcommand{\sociallink}[3]{\mbox{\textcolor{symbolcolor}{#1}\link{#2}{#3}\hspace{0.8em}}}

% Define author's name
% Usage: \name{<firstname>}{<lastname>}
% Usage: \firstname{<firstname>}
% Usage: \lastname{<lastname>}
% Usage: \familyname{<familyname>}
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\newcommand*{\familyname}[1]{\def\@lastname{#1}}
\def\@familyname{\@lastname}

% Define author's tagline
% Usage: \tagline{<tag line>}
\newcommand*{\tagline}[1]{\def\@tagline{#1}}

% Define author's photo
% Usage: \photo[<shape: circular, square, roundedsquare, squircle>]{<diameter>}{<photo>}
% The shape of the author's photo is circular by default.
\newcommand{\photo}[3][circular]{\def\@photo{#3}\def\@photodiameter{#2}\def\@photoshape{#1}}

% Render author's address
% Usage: \address{<address>}
\newcommand*{\address}[1]{\socialtext{\locationSymbol}{#1}}

% Render author's infos
% Usage: \infos{<infos>}
\newcommand*{\infos}[1]{\socialtext{\infoSymbol}{#1}}

% Render author's linked-in (optional)
% Usage: \linkedin{<linked-in-nick>}
\newcommand*{\linkedin}[1]{\sociallink{\linkedinSymbol}{http://www.linkedin.com/in/#1/en}{linkedin.com/in/#1}}

%\newcommand*{\rg}[1]{\sociallink{\RGSymbol}{https://www.researchgate.net/profile/#1}{researchgate.net/profile/#1}}

\newcommand*{\rg}[1]{\sociallink{\RGSymbol}{https://www.researchgate.net/profile/#1}{\,researchgate}}


\newcommand*{\gs}[1]{\sociallink{\GSSymbol}{https://scholar.google.ca/citations?hl=en&user=jRUj6fkAAAAJ}{\,google scholar}}


\newcommand*{\thesis}{\sociallink{}{https://dx.doi.org/10.14288/1.0402625}{here}}


%\newcommand*{\thesis}[1]{\sociallink{\ThesisSymbol}{https://dx.doi.org/10.14288/1.0402625}{\,PhD thesis}}

% Render author's viadeo(optional)
% Usage: \viadeo{<viadeo-nick>}
\newcommand*{\viadeo}[1]{\sociallink{\viadeoSymbol}{http://www.viadeo.com/fr/profile/#1}{viadeo.com/fr/profile/#1}}

% Render author's github (optional)
% Usage: \github{<github-nick>}
\newcommand*{\github}[1]{\sociallink{\githubSymbol}{https://www.github.com/#1}{github.com/#1}}           % Github icon + URL

% Render author's stackoverflow profile (optional)
% Usage: \stackoverflow{<stackoverflow-user-id>}
\newcommand*{\stackoverflow}[1]{\sociallink{\stackoverflowSymbol}{https://www.stackoverflow.com/u/#1}{stackoverflow.com/u/#1}}

% Render author's stackexchange profile (optional)
% Usage: \stackexchange{<stackexchange-user-id>}
\newcommand*{\stackexchange}[1]{\sociallink{\stackexchangeSymbol}{https://stackexchange.com/users/#1}{stackexchange.com/users/#1}}

% Render author's medium (optional)
% Usage: \medium{<medium-nick>}
\newcommand*{\medium}[1]{\sociallink{\mediumSymbol}{https://www.medium.com/@#1}{medium.com/#1}}

% Render author's bitbucket (optional)
% Usage: \bitbucket{<bitbucket-account-name>}
\newcommand*{\bitbucket}[1]{\sociallink{\bitbucketSymbol}{https://bitbucket.com/#1}{bitbucket.com/#1}}

% Render author's email (optional)
% Usage: \email{<email adress>}
\newcommand*{\email}[1]{\sociallink{\mailSymbol}{mailto:#1}{#1}}

% Render a website link (optional)
% Usage: \website{<website name>}{<website adress>}
\newcommand*{\website}[2]{\sociallink{\websiteSymbol}{#1}{#2}}

% Render author's mobile phone (optional)
% Usage: \smartphone{<mobile phone number>}
\newcommand*\smartphone[1]{\socialtext{\mobileSymbol}{#1}}

% Render author's tagline
\newcommand\resumetitle[1]{

    \vspace{-0.3cm}
    \hspace{0.05cm}\color{accentcolor}\textbf{\large{#1}}\color{black}
    \vspace{0.2cm}\\
}


% Define social entries to print in header
\newcommand{\socialinfo}[1]{\def\@socialinfo{#1}}

% Render CV header
% Needs \@firstname, \@lastname and \@tagline to be defined
\newcommand*{\makecvheader}{
    \begin{minipage}{\linewidth}
    \color{accentcolor}\user{\@firstname}{\@lastname}\color{black}\\
    \resumetitle{\@tagline}
    \small{\@socialinfo}
    \end{minipage}
    \bigskip
}

\newcommand*{\makecvfooter}[3]{%
  \fancyfoot{}
  \fancyfoot[L]{\color{accentcolor}#1}
  \fancyfoot[C]{\color{accentcolor}#2}
  \fancyfoot[R]{\color{accentcolor}#3}
}

% Resume part title definition
\newcommand\sectionTitle[2]{\section{\texorpdfstring{\color{accentcolor}#2\enspace \textsc{#1}}{#1}}}



% ---------------------------------------------------------------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax




\usepackage{simplehipstercv_cl}
