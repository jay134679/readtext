% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/readtxt.R
\name{readtxt}
\alias{readtxt}
\title{read a text file(s)}
\usage{
readtxt(file, ignoreMissingFiles = FALSE, textfield = NULL,
  docvarsfrom = c("metadata", "filenames"), dvsep = "_",
  docvarnames = NULL, encoding = NULL, ...)
}
\arguments{
\item{file}{the complete filename(s) to be read. This is designed to 
automagically handle a number of common scenarios, so the value can be a
"glob"-type'  wildcard value.  Currently available filetypes are: 
\describe{
\item{\code{txt}}{plain text files:
So-called structured text files, which describe both texts and metadata:
For all structured text filetypes, the column, field, or node 
which contains the the text must be specified with the \code{textfield}
parameter, and all other fields are treated as docvars.}
\item{\code{json}}{data in some form of JavaScript 
Object Notation, consisting of the texts and optionally additional docvars.
The supported formats are:
\itemize{
\item a single JSON object per file
\item line-delimited JSON, with one object per line
\item line-delimited JSON, of the format produced from a Twitter stream.
This type of file has special handling which simplifies the Twitter format
into docvars.  The correct format for each JSON file is automatically detected.}}
\item{\code{csv,tab,tsv}}{comma- or tab-separated values}
\item{\code{xml}}{Basic flat XML documents are supported -- those of the 
kind supported by the function xmlToDataFrame function of the \strong{XML} 
package.}
\code{file} can also not be a path to a single local file, such as
 \item{a wildcard value}{any valid 
pathname with a wildcard ("glob") expression that can be expanded by the 
operating system.  This may consist of multiple file types.} 
\item{a URL to a remote}{which is downloaded then loaded} 
\item{\code{zip,tar,tar.gz,tar.bz}}{archive file, which is unzipped. The 
contained files must be either at the top level or in a single directory.
Archives, remote URLs and glob patterns can resolve to any of the other 
filetypes, so you could have, for example, a remote URL to a zip file which
contained Twitter JSON files.}
}}

\item{ignoreMissingFiles}{if \code{FALSE}, then if the file
argument doesn't resolve to an existing file, then an error will be thrown.
Note that this can happen in a number of ways, including passing a path 
to a file that does not exist, to an empty archive file, or to a glob 
pattern that matches no files.}

\item{textfield}{a variable (column) name or column number indicating where 
to find the texts that form the documents for the corpus.  This must be 
specified for file types \code{.csv} and \code{.json}.}

\item{docvarsfrom}{used to specify that docvars should be taken from the 
filenames, when the \code{readtxt} inputs are filenames and the elements 
of the filenames are document variables, separated by a delimiter 
(\code{dvsep}).  This allows easy assignment of docvars from filenames such
as \code{1789-Washington.txt}, \code{1793-Washington}, etc. by \code{dvsep}
or from meta-data embedded in the text file header (\code{headers}).}

\item{dvsep}{separator used in filenames to delimit docvar elements if 
\code{docvarsfrom="filenames"} is used}

\item{docvarnames}{character vector of variable names for \code{docvars}, if 
\code{docvarsfrom} is specified.  If this argument is not used, default 
docvar names will be used (\code{docvar1}, \code{docvar2}, ...).}

\item{encoding}{vector: either the encoding of all files, or one encoding
for each files}

\item{...}{additional arguments passed through to low-level file reading 
function, such as \code{\link{file}}, \code{\link{read.csv}}, etc.  Useful 
for specifying an input encoding option, which is specified in the same was
as it would be give to \code{\link{iconv}}.  See the Encoding section of 
\link{file} for details.  Also useful for passing arguments through to
\code{\link{read.csv}}, for instance `quote = ""`, if quotes are causing
problems within comma-delimited fields.}
}
\value{
a data.frame consisting of a first column \code{texts} that contains
the texts, with any additional columns consisting of docvars.  This object can
be input directly into the \pkg{quanteda} package's \code{\link[quanteda]{corpus}} 
to construct a corpus.
}
\description{
Read texts and (if any) associated document-level meta-data from one or more source files. 
The text source files 
come from the textual component of the files, and the document-level
metadata ("docvars") come from either the file contents or filenames.
}
\details{
If \code{cache = TRUE}, the constructor does not store a copy of 
  the texts, but rather reads
  in the texts and associated data, and saves them to a temporary disk file 
  whose location is specified in the \link{readtext} object.  This 
  prevents a complete copy of the object from cluttering the global 
  environment and consuming additional space.  This does mean however that 
  the state of the file containing the source data will not be cross-platform
  and may not be persistent across sessions.  So the recommended usage is to 
  load the data into a corpus in the same session in which \code{readtxt} is
  called.
}
\author{
Adam Obeng, Kenneth Benoit, and Paul Nulty
}

