context("Get graph metrics")

test_that("Getting a degree histogram is possible", {

  # Create a random graph
  graph <-
    create_random_graph(
      10, 22, set_seed = 23)

  # Get the degree histogram for total degree
  degree_hist_all <- get_degree_histogram(graph, mode = "all")

  # Expect that `degree_hist_all` inherits from `data.frame`
  expect_is(degree_hist_all, "data.frame")

  # Expect certain column names for the `degree_hist_all` object
  expect_identical(
    colnames(degree_hist_all),
    c("degree", "total_degree_hist"))

  # Get the degree histogram for in-degree
  degree_hist_in <- get_degree_histogram(graph, mode = "in")

  # Expect that `degree_hist_in` inherits from `data.frame`
  expect_is(degree_hist_in, "data.frame")

  # Expect certain column names for the `degree_hist_in` object
  expect_identical(
    colnames(degree_hist_in),
    c("degree", "indegree_hist"))

  # Get the degree histogram for out-degree
  degree_hist_out <- get_degree_histogram(graph, mode = "out")

  # Expect that `degree_hist_out` inherits from `data.frame`
  expect_is(degree_hist_out, "data.frame")

  # Expect certain column names for the `degree_hist_out` object
  expect_identical(
    colnames(degree_hist_out),
    c("degree", "outdegree_hist"))
})

test_that("Getting degree distribution is possible", {

  # Create a random graph
  graph <-
    create_random_graph(
      10, 22, set_seed = 23)

  # Get the degree distribution for total degree
  degree_dist_all <- get_degree_distribution(graph, mode = "all")

  # Expect that `degree_dist_all` inherits from `data.frame`
  expect_is(degree_dist_all, "data.frame")

  # Expect certain column names for the `degree_dist_all` object
  expect_identical(
    colnames(degree_dist_all),
    c("degree", "total_degree_dist"))

  # Get the degree distribution for in-degree
  degree_dist_in <- get_degree_distribution(graph, mode = "in")

  # Expect that `degree_dist_in` inherits from `data.frame`
  expect_is(degree_dist_in, "data.frame")

  # Expect certain column names for the `degree_dist_in` object
  expect_identical(
    colnames(degree_dist_in),
    c("degree", "indegree_dist"))

  # Get the degree distribution for out-degree
  degree_dist_out <- get_degree_distribution(graph, mode = "out")

  # Expect that `degree_dist_out` inherits from `data.frame`
  expect_is(degree_dist_out, "data.frame")

  # Expect certain column names for the `degree_dist_out` object
  expect_identical(
    colnames(degree_dist_out),
    c("degree", "outdegree_dist"))
})

test_that("Getting graph diameter is possible", {

  # Create a random graph
  graph <-
    create_random_graph(
      10, 22, set_seed = 23)

  graph_diam <- get_graph_diameter(graph)

  # Expect that `graph_diam` is an integer vector
  expect_is(graph_diam, "integer")

  # Expect that `graph_diam` is of length 1
  expect_equal(length(graph_diam), 1)

  # Expect that `graph_diam` has the value 4
  expect_equal(graph_diam, 4)
})

test_that("Getting graph eccentricity is possible", {

  # Create a random graph
  graph <-
    create_random_graph(
      10, 22, set_seed = 23)

  graph_eccen <- get_eccentricity(graph)

  # Expect that `graph_eccen` is a data frame
  expect_is(graph_eccen, "data.frame")

  # Expect that `graph_eccen` has 10 rows
  # this case
  expect_equal(nrow(graph_eccen), 10)

  # Expect certain column names for the `graph_eccen` object
  expect_equal(colnames(graph_eccen), c("id", "eccentricity"))

  # Expect that `eccentricity` column is numeric
  expect_is(graph_eccen$eccentricity, "numeric")

  # Expect that `id` column has integer values
  expect_is(graph_eccen$id, "integer")
})

test_that("Getting graph periphery is possible", {

  # Create a random graph
  graph <-
    create_random_graph(
      10, 22, set_seed = 23)

  graph_periphery <- get_periphery(graph)

  # Expect that `graph_periphery` is an integer vector
  expect_is(graph_periphery, "integer")

  # Expect that `graph_periphery` has length 3 in
  # this case
  expect_equal(length(graph_periphery), 3)

  # Expect certain values for the
  # `graph_periphery` object
  expect_equal(graph_periphery, c(1, 2, 4))
})

test_that("Getting graph info is possible", {

  # Create a random graph
  graph <-
    create_random_graph(
      10, 22, set_seed = 23)

  # Add a graph name
  graph <- set_graph_name(graph, "random")

  # Add a graph time
  graph <-
    set_graph_time(graph, time = "2015-10-25 15:23:00")

  # Use the `graph_info()` function to create a
  # data frame with graph metrics
  graph_i <- graph_info(graph)

  # Expect that `graph_i` is a data frame
  expect_is(graph_i, "data.frame")

  # Expect that `graph_i` has 9 columns
  expect_equal(ncol(graph_i), 9)

  # Expect that `graph_i` has 1 row
  expect_equal(nrow(graph_i), 1)

  # Expect that `graph_i` has certain column names
  expect_identical(
    colnames(graph_i),
    c("name", "n", "e", "dens", "mn_deg",
      "mx_deg", "avg_deg", "time", "tz"))
})

test_that("Checking whether the graph is connected is possible", {

  # Create a random graph
  graph_connected <-
    create_random_graph(
      10, 22, set_seed = 23)

  # Test that the graph is indeed connected
  expect_true(is_graph_connected(graph_connected))

  graph_not_connected <-
    create_random_graph(
      10, 8, set_seed = 1)

  # Test that the graph is indeed connected
  expect_false(is_graph_connected(graph_not_connected))
})
