\ProvidesClass{twentysecondcv}[2015/02/28 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

%----------------------------------------------------------------------------------------
%	 REQUIRED PACKAGES
%-----------------------------------------------------------------------	-----------------

\usepackage[utf8]{inputenc}



\RequirePackage[quiet]{fontspec}
%\RequirePackage[sfdefault]{ClearSans}
% If you want to add fontawesome package:
% (1) You need to compile the tex file with XeLaTeX or LuaLaTeX
% References:
%   http://texdoc.net/texmf-dist/doc/latex/fontawesome/fontawesome.pdf
%   https://www.ctan.org/tex-archive/fonts/fontawesome?lang=en
% (2) You have to use the fontspec package
% (3) On my particular case (probably version dependent) I also had to uninstall and reinstall fontspec via MiKTeX Package Manager (Admin). 
%  Otherwise, I would get the error reported here:
%    https://tex.stackexchange.com/questions/383240/fontspec-error-in-xelatex/398353#398353
\usepackage{fontawesome}


\def\arrow#1{\pspicture[shift=2pt](#1,0)\psline{->}(#1,0)\endpspicture}

\usepackage{pstricks}

\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{forloop}
\RequirePackage{marvosym}
\RequirePackage{parskip}



\usepackage{enumitem}
\setlist[itemize]{leftmargin=*}

\RequirePackage[hidelinks]{hyperref}
\hypersetup{
    pdftitle={},
    pdfauthor={},
    pdfsubject={},
    pdfkeywords={},
    colorlinks=false,           % no lik border color
    allbordercolors=white       % white border color for all
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\ifxetex
  \usepackage{letltxmacro}
  \setlength{\XeTeXLinkMargin}{1pt}
  \LetLtxMacro\SavedIncludeGraphics\includegraphics
  \def\includegraphics#1#{% #1 catches optional stuff (star/opt. arg.)
    \IncludeGraphicsAux{#1}%
  }%
  \newcommand*{\IncludeGraphicsAux}[2]{%
    \XeTeXLinkBox{%
      \SavedIncludeGraphics#1{#2}%
    }%
  }%
\fi

%----------------------------------------------------------------------------------------
%	 COLOURS
%----------------------------------------------------------------------------------------

\definecolor{white}{RGB}{255,255,255}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{sidecolor}{HTML}{E7E7E7}
\definecolor{mainblue}{HTML}{0E5484}
\definecolor{maingray}{HTML}{B9B9B9}

\definecolor{pblue}{HTML}{0395DE}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{ff0000}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{pblue}{HTML}{0395DE}
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


%Colors for icons
\definecolor{linkedin}{HTML}{0085AE}
\definecolor{skype}{HTML}{00aff0}
\definecolor{outlook}{HTML}{0078d7}


\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%----------------------------------------------------------------------------------------
%	 MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

%Header and Footer
\usepackage[lastpage,user]{zref}
\usepackage{fancyhdr}
\pagestyle{fancy} % Turn on the style
\fancyhf{} % sets both header and footer to nothing
\renewcommand{\headrulewidth}{0pt}
\fancyheadoffset[lf]{6.6cm}% set to main text body offset - sidebar left margin
\fancyfoot[L]{\today} 
\fancyfoot[R]{Page \thepage\ / \zpageref{LastPage}} % Set the right side of the footer to be the page number


\setlength{\parindent}{0pt} % Disable paragraph indentation

% --------------------------------------------------------------------------------------
% 	FONTS
%-------------------------------------------------------------------------------------
\newfontfamily\headingfont[Path = fonts/]{segoeuib.ttf}

%----------------------------------------------------------------------------------------
%	 SIDEBAR DEFINITIONS
%----------------------------------------------------------------------------------------

\setlength{\TPHorizModule}{1cm} % Left margin
\setlength{\TPVertModule}{1cm} % Top margin

\newlength\imagewidth
\newlength\imagescale
\pgfmathsetlength{\imagewidth}{5cm}
\pgfmathsetlength{\imagescale}{\imagewidth/600}

\newcommand{\profilesection}[2]{\vspace{8pt}{\color{black!80} \huge #1 \rule[0.15\baselineskip]{#2}{1pt}}}

% Define custom commands for CV info
\newcommand{\cvname}[1]{\renewcommand{\cvname}{#1}}
\newcommand{\cvjobtitle}[1]{\renewcommand{\cvjobtitle}{#1}}
\newcommand{\profilepic}[1]{\renewcommand{\profilepic}{#1}}
\newcommand{\cvaddress}[1]{\renewcommand{\cvaddress}{#1}}
\newcommand{\cvnumberphone}[1]{\renewcommand{\cvnumberphone}{#1}}
\newcommand{\cvmail}[1]{\renewcommand{\cvmail}{#1}}
\newcommand{\cvskype}[1]{\renewcommand{\cvskype}{#1}}
\newcommand{\cvsite}[1]{\renewcommand{\cvsite}{#1}}
\newcommand{\cvlinkedin}[1]{\renewcommand{\cvlinkedin}{#1}}
\newcommand{\cvgithub}[1]{\renewcommand{\cvgithub}{#1}}

\newcommand{\cvdate}[1]{\renewcommand{\cvdate}{#1}}
\newcommand{\aboutme}[1]{\renewcommand{\aboutme}{#1}}



% Command for printing the contact information icons
\newcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt, fill=mainblue,mainblue,text=white] (char) {#1};}}

% Commands for printing languages section
\newcommand{\mothertongue}[1]{\renewcommand{\mothertongue}{#1}}
\newcounter{barcount}
\newcommand\languages[1]{ 
	\renewcommand{\languages}{
		\textbf{Mother Tongue:} \mothertongue
		
		\textbf{Other languages:}
		
		\begin{tikzpicture}			
			\foreach [count=\i] \x/\y in {#1}{
				\forloop[1] {barcount} {0} {\value{barcount} < 6} {
					\ifnum\y>\value{barcount}
						\draw[fill=maingray,mainblue] [rounded corners] (\value{barcount}*5/6,\i) rectangle (\value{barcount}*5/6+0.7,\i+0.4);
					\else
						\draw[fill=maingray,maingray] [rounded corners] (\value{barcount}*5/6,\i) rectangle (\value{barcount}*5/6+0.7,\i+0.4);
					\fi					
				}
				\node [above right] at (0,\i+0.35) {\x};
			}
		\end{tikzpicture}
		\\ Self-evaluation according to \href{https://en.wikipedia.org/wiki/Common_European_Framework_of_Reference_for_Languages\#Common_reference_levels}{CEFRL} \\
	}
}

\newcommand{\certifications}[1]{\renewcommand{\certifications}{#1}}
\newcommand{\sideprojects}[1]{\renewcommand{\sideprojects}{#1}}
\newcommand{\conferences}[1]{\renewcommand{\conferences}{#1}}
\newcommand{\books}[1]{\renewcommand{\books}{#1}}

%----------------------------------------------------------------------------------------
%  Header
%----------------------------------------------------------------------------------------
\newcommand{\makeheader}{%

	\begin{center}	
		{\Huge\color{gray}\cvname}
		
		\vspace{2mm}
		
		{\Large\color{pblue}\cvjobtitle}
	\end{center}
	
	% Fake text to add separator      
	\fcolorbox{white}{gray}{\parbox{\dimexpr\textwidth-2\fboxsep-2\fboxrule}{%
		.		
	}}
}

%----------------------------------------------------------------------------------------
%  SIDEBAR LAYOUT
%----------------------------------------------------------------------------------------

\newcommand{\makeprofile[1]}{
  \begin{tikzpicture}[remember picture,overlay]
      \node [rectangle, anchor=north, minimum width=9cm, minimum height=\paperheight+1cm] (box) at (-2cm,0.5cm){};
  \end{tikzpicture}

  %------------------------------------------------

  \begin{textblock}{6}(1, 1) %start at left and start at top. Must match the margins set at the bottom
  
	\ifthenelse{\equal{#1}{1}}
	{\makeprofilefirst}
	{\makeprofilesecond}
           
  \end{textblock}
    
}

%----------------------------------------------------------------------------------------
%  SIDEBAR LAYOUT 1st page
%----------------------------------------------------------------------------------------
\newcommand{\makeprofilefirst}{
		\ifthenelse{\equal{\profilepic}{}}{}{
			\begin{center}
				\includegraphics[scale=0.7]{\profilepic}
			\end{center}
		}		 	 
	
		\vspace{4mm}
		\renewcommand{\arraystretch}{2}
		\begin{tabular}{p{1cm} @{\hskip 0.5cm}p{5cm}}
			\ifthenelse{\equal{\cvaddress}{}}{}
			{
				{$
					\begin{array}{l}
						\hspace{3.8mm} $\huge$ \textnormal{\textcolor{red}{\faMapMarker}}
					\end{array}
				$} & \href{https://maps.google.com/?q=\cvaddress}{\cvaddress} \\
			}   
			\ifthenelse{\equal{\cvnumberphone}{}}{}
			{
				{$
					\begin{array}{l}
						\hspace{4mm} $\huge$ \textnormal{\faMobile} 
					\end{array}
				$} & \cvnumberphone\\
			}
			\ifthenelse{\equal{\cvmail}{}}{}
			{
				{$
					\begin{array}{l}
						\hspace{2.5mm} $\huge$ \textnormal{\textcolor{outlook}{\faEnvelopeO}}
					\end{array}
				$} & \href{mailto:\cvmail}{\cvmail} \\
			}
			\ifthenelse{\equal{\cvskype}{}}{}
			{
				{$
					\begin{array}{l}
						\hspace{2.8mm} $\huge$ \textnormal{\textcolor{skype}{\faSkype}}
					\end{array}
				$} & \cvskype \\
			}              
			\ifthenelse{\equal{\cvsite}{}}{}
			{
				{$
					\begin{array}{l}
						\hspace{2.8mm} $\huge$ \textnormal{\textcolor{test}{\faGlobe}}
					\end{array}
				$} & \href{http://\cvsite}{\cvsite} \\
			}
			\ifthenelse{\equal{\cvgithub}{}}{}
			{
				{$
					\begin{array}{l}
						\hspace{3mm} $\huge$ \textnormal{\faGithub}
					\end{array}
				$} & \href{https://www.github.com/\cvgithub}{\cvgithub} \\
			} 			
			\ifthenelse{\equal{\cvlinkedin}{}}{}
			{
				{$
					\begin{array}{l}
						\hspace{3mm} $\huge$ \textnormal{\textcolor{linkedin}{\faLinkedin}}
					\end{array}
				$} & \href{https://www.linkedin.com\cvlinkedin}{\cvlinkedin} \\
			}    
		\end{tabular}
	
		%------------------------------------------------
		%\vspace{4mm}
		\profilesection{Skills}{4cm}
		
		{\large \textbf{Top Skills Overview}}
	
		\skills
			
		%------------------------------------------------
			
		\vspace{3mm}
		
    \profilesection{Languages}{2.5cm}
      	
    \languages	  
      
}

%----------------------------------------------------------------------------------------
%  SIDEBAR LAYOUT 2nd page
%----------------------------------------------------------------------------------------
\newcommand{\makeprofilesecond}{

	\ifthenelse{\equal{\expandonce\certifications}{}}{}
	{
    \profilesection{Certifications}{1.9cm} 
		\certifications
	}

	\vspace{3mm}

	\ifthenelse{\equal{\expandonce\sideprojects}{}}{}
	{
    \profilesection{Side Projects}{2cm} 
		\sideprojects
	}

	\vspace{3mm}

	\ifthenelse{\equal{\expandonce\books}{}}{}
	{
    \profilesection{Technical Books}{1.2cm}
		\books
	}

	\vspace{3mm}

	\ifthenelse{\equal{\expandonce\conferences}{}}{}
	{
    \profilesection{Conferences}{2.3cm}
		\conferences
	}
}
%----------------------------------------------------------------------------------------
%	 COLOURED SECTION TITLE BOX
%----------------------------------------------------------------------------------------

% Command to create the rounded boxes around the first three letters of section titles
\newcommand*\round[2]{%
	\tikz[baseline=(char.base)]\node[anchor=north west, draw,rectangle, rounded corners, inner sep=1.6pt, minimum size=5.5mm, text height=3.6mm, fill=#2,#2,text=white](char){#1};%
}

\def\@sectioncolor#1#2#3{%
	{%
		\color{pblue} #1#2#3%
	}%
}


\renewcommand{\section}[1]{
  \par\vspace{\parskip}
	{%
		\LARGE\headingfont\color{headercolor}%
		\@sectioncolor #1%
	}
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
	\par\vspace{.5\parskip}{%
		\Large\headingfont\color{headercolor} #1%
	}
	\par\vspace{.25\parskip}%
}

%----------------------------------------------------------------------------------------
%	 LONG LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the long list
\newenvironment{twenty}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

% \newcommand{\twentyitem}[5]{%
% 	#1&\parbox[t]{0.83\textwidth}{%
% 		\textbf{#2}% 
% 		\hfill%
% 		{\footnotesize#3}\\%
%         \ifblank{#4}{}{#4 \\}
% 		#5\vspace{\parsep}%
% 	}\\
% }

\newcommand{\twentyitem}[6]{%
	#1&\parbox[t]{0.83\textwidth}{%
		\textbf{#3}% 
		\hfill%
		{\footnotesize#4}%
        }\\%
    #2&\parbox[t]{0.83\textwidth}{%
		\ifblank{#5}{}{#5 \\}
		#6%
	}\\
}

%----------------------------------------------------------------------------------------
%	 SMALL LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the small list
\newenvironment{twentyshort}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentyitemshort}[2]{%
	#1&\parbox[t]{0.83\textwidth}{%
		#2%
	}\\
}

%----------------------------------------------------------------------------------------
%	 MARGINS AND LINKS
%----------------------------------------------------------------------------------------

\RequirePackage[left=7.6cm,top=1cm,right=1cm,bottom=1cm,nohead,nofoot]{geometry}

\usepackage{smartdiagram}
\smartdiagramset{
    bubble center node font = \footnotesize,
    bubble node font = \footnotesize,
    % specifies the minimum size of the bubble center node
    bubble center node size = 0.5cm,
    %  specifies the minimum size of the bubbles
    bubble node size = 0.5cm,
    % specifies which is the distance among the bubble center node and the other bubbles
    distance center/other bubbles = 0.3cm,
    % sets the distance from the text to the border of the bubble center node
    distance text center bubble = 0.5cm,
    % set center bubble color
    bubble center node color = pblue,
    % define the list of colors usable in the diagram
    set color list = {lightgray, materialcyan, orange, green, materialorange, materialteal, materialamber, materialindigo, materialgreen, materiallime},
    % sets the opacity at which the bubbles are shown
    bubble fill opacity = 0.6,
    % sets the opacity at which the bubble text is shown
    bubble text opacity = 1,
}

%----------------------------------------------------------------------------------------
%	 Bibliography
%----------------------------------------------------------------------------------------

%To highlight own name when listing publications (use this command when inserting your name on the .bib file)
\newcommand{\myname}[1]{\textbf{#1}}