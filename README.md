# ScratchConsole01
Testing Many:Many Relationships on Temporal Tables

## Problem
When we create a many:many relationship between two tables, using an associative table, and these tables have system-versioning enabled, we find that EF is confused about the names of the PeriodStart and PeriodEnd column names.

The error message is:

`System.InvalidOperationException: 'When multiple temporal entities are mapped to the same table, their period start properties must map to the same column. Issue happens for entity type 'PostTag' with period property 'PeriodStart' which is mapped to column 'PeriodStart'. Expected period column name is 'PostTag_PeriodStart'.`

## Steps to Reproduce
1. Clone this repository
1. Create a SQL database 'MM_Temporal_Test' on your local SQL Server
1. Run the script Create.SQL.Objects.sql to create the tables
1. Run the console app 
1. Observe the error above

## Additional Information
We created the EF objects using reverse engineering from the database. This created navigation properties in the `Post` and `Tag` classes. We then added skip navigation properties to the `Post` and `Tag` classes to represent the many:many relationship.  The error occurs at runtime when we try to add a `Post` to a `Tag` or vice versa.

