\NeedsTeXFormat{LaTeX2e}[2011/06/27]
\ProvidesClass{bthesis}[2013/06/27 v0.01]

\RequirePackage{graphicx}
\RequirePackage{tabularx}
\RequirePackage{kvoptions}


\DeclareBoolOption{japanese}
\DeclareStringOption[.]{imgdir}
\ProcessKeyvalOptions*

% pass left options to parent documentclass
\ifbthesis@japanese
  \DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{jreport}}
\else
  \DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{report}}
\fi

\ProcessKeyvalOptions*

% load parent class
\ifbthesis@japanese
  \LoadClass{jreport}
\else
  \LoadClass{report}
\fi

% override layout
\topmargin=-0.2cm
\headheight=0cm
\headsep=0cm
\footskip=0cm
\oddsidemargin=-0.04cm
\evensidemargin=-0.04cm
\textheight=24.7cm
\textwidth=16.5cm
\footskip=1.5cm

\def\row#1{%
  \hbox to \hsize{%
    \vbox{\centering\Large #1}
  }
}

\def\tablerow#1#2{%
  \centering
  \begin{tabularx}{10cm}{Xr}
    {\Large #1} & {\Large #2}
  \end{tabularx}
}

\ifbthesis@japanese
% define japanese titlepage
  \makeatletter
  \hfuzz=3pt
    \def\header{%
      \centering
      \includegraphics[scale=0.8]{\bthesis@imgdir/waseda_logo_bw.eps}
      
      {\huge 卒業論文}
    }

    \def\maketitle{%
      \setlength{\baselineskip}{38pt}
      \thispagestyle{empty}
        \vfill
        \header
        \vspace{3cm}
        \row{\Huge \@title}

        \vspace{5cm}
        \row{\@institute}
        \vspace{3mm}
        \row{\LARGE \@author}
        \vspace{1cm}
        \tablerow{学籍番号}{\@studentnb}
        \tablerow{提出}{\@date}
        \tablerow{指導教授}{\@supervisor}
        \vfill
      \cleardoublepage
    }
    
    \def\date#1{\def\@date{#1}}
    \def\author#1{\def\@author{#1}}
    \def\title#1{\def\@title{#1}}
    \def\institute#1{\def\@institute{#1}}
    \def\email#1{\def\@email{#1}}
    \def\studentnb#1{\def\@studentnb{#1}}
    \def\supervisor#1{\def\@supervisor{#1}}
    \def\diploma#1{\def\@diploma{#1}}
  \makeatother

  \institute{%
    早稲田大学\\
    基幹理工学部\\
    情報理工学科
  }
  
\else
% define english titlepage
  \makeatletter
  \hfuzz=3pt
    \def\info{
      \row{
        \setlength{\baselineskip}{30pt}
        Thesis submitted in partial fullfillment of\\
        the requirements for the degree of\\
      }
      \row{\LARGE \@diploma}
    }
    \def\footer{
      \begin{tabularx}{15cm}{rr}
	\begin{minipage}[c]{0.6\linewidth}
          \setlength{\baselineskip}{20pt}
          \begin{flushright}
            {\Large \@institute}
          \end{flushright}
	\end{minipage} &
	\begin{minipage}[c]{0.4\linewidth}
          \includegraphics[scale=0.6]{\bthesis@imgdir/waseda_logo_bw.eps}
	\end{minipage}
      \end{tabularx}
    }

    \def\maketitle{%
      \setlength{\baselineskip}{38pt}
      \thispagestyle{empty}\vbox to \vsize{%
        \vfill
        \vspace{3cm}
        \row{\Huge \@title}
        \vspace{4cm}
        \row{\huge\@author}
        \vspace{2cm}
        \info{}
        \vspace{1cm}
        \tablerow{Student ID}{\@studentnb}
        \tablerow{Submission Date}{\@date}
        \tablerow{Supervisor}{\@supervisor}
        \vfill
        \footer{}
        \vfill
      }%
      \cleardoublepage
    }
    
    \def\date#1{\def\@date{#1}}
    \def\author#1{\def\@author{#1}}
    \def\title#1{\def\@title{#1}}
    \def\institute#1{\def\@institute{#1}}
    \def\email#1{\def\@email{#1}}
    \def\studentnb#1{\def\@studentnb{#1}}
    \def\supervisor#1{\def\@supervisor{#1}}
    \def\diploma#1{\def\@diploma{#1}}
  \makeatother
  
  \institute{%
    Department of Computer Science\\
    School of Science and Engineering\\
    Waseda University
  }

\fi
\endinput