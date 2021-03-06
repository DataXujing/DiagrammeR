% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/render_graph_panel.R
\name{render_graph_panel}
\alias{render_graph_panel}
\title{Render several graphs in a single panel}
\usage{
render_graph_panel(..., ncols = NULL, nrows = NULL, titles = NULL)
}
\arguments{
\item{...}{2 or more graph objects of class
\code{dgr_graph}.}

\item{ncols}{an option to provide the number
of columns in the graph layout.}

\item{nrows}{an option to provide the number
of rows in the graph layout.}

\item{titles}{an optional vector of titles for
each of the graphs displayed.}
}
\description{
Using 2 or more \code{dgr_graph}
objects, render theses graph in a single panel.
}
\examples{
\dontrun{
# Create 4 random graphs with 25 nodes and
# increasing numbers of edges
graph_1 <-
  create_random_graph(
    n = 25, m = 15, set_seed = 23)

graph_2 <-
  create_random_graph(
    n = 25, m = 25, set_seed = 23)

graph_3 <-
  create_random_graph(
    n = 25, m = 35, set_seed = 23)

graph_4 <-
  create_random_graph(
    n = 25, m = 45, set_seed = 23)

# Create a function to apply the
# PageRank algorithm to the graph
# and then color nodes by their
# PageRank values
pagerank_color <- function(x) {
  x \%>\%
  join_node_attrs(get_pagerank(.)) \%>\%
  rescale_node_attrs(
    node_attr_from = "pagerank",
    to_lower_bound = "steelblue",
    to_upper_bound = "red",
    node_attr_to = "fillcolor",
    from_lower_bound = 0,
    from_upper_bound = 1)
}

# Render all four graphs in the
# order specified while applying
# the `pagerank_color` function
render_graph_panel(
  graph_1 \%>\% pagerank_color,
  graph_2 \%>\% pagerank_color,
  graph_3 \%>\% pagerank_color,
  graph_4 \%>\% pagerank_color,
  ncols = 2,
  nrows = 2)
}
}
