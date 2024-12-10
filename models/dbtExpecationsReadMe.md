# What is dbt expectations?

dbt expectations is an open source package for dbt based on Great Expectations, to enable testing in a data warehouse.

Using the dbt expectations package allows data to be verified in terms of quality and accuracy at specific stages of the transformation process. It includes built in tests including not_null, unique etc. and custom tests written in sql which can extend test coverage (see `/tests/no_nulls_in_dim_listing` for example.)

When the package is imported etc. the tests are written in the schema.yml file. This is a breakdown of the examples in `/models/schema.yml`:

**Built in dbt tests:**

- not_null: Ensures that the column doesn't contain null values.
- unique: Verifies that all values in the column are distinct.

- relationships: Checks if a foreign key relationship exists between two columns in different models.

- accepted_values: Ensures that the column only contains specific values from a predefined list.
- positive_value: Verifies that the column values are positive numbers.

**dbt-expectations Tests:**

- dbt_expectations.expect_table_row_count_to_equal_other_table: Compares the row count of two tables.
- dbt_expectations.expect_column_values_to_be_of_type: Checks the data type of a column.
- dbt_expectations.expect_column_quantile_values_to_be_between: Verifies that quantile values fall within a specific range.
- dbt_expectations.expect_column_max_to_be_between: Ensures that the maximum value of a column is within a certain range.

**To run the tests in the schema:**
`dbt test`
To run a specific test:
`dbt test --select model:dim_listings_cleansed`

To debug, the standard tool is `dbt test --debug`, but the advice on the bootcamp course is to run the failing test to find the sql which failed.

In a specific example, the failing sql code is run directly against the table (in Snowflake in this example) to find where exactly the failure is.
