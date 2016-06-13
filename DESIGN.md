# PURPOSE

Make it easy to track income and expenses, allowing review on where
the money is coming/going to (e.g. food, utilities, your side job, etc.).

# DESIGN

## Layout

The program consists of a series of plugins, allowing for input and output
sources to be easily extended, even by the user themselves (providing
they can code a plugin). There are these categories of plugins:

### Input Plugins

These plugins handle collecting transactions.
Specifically, their job is to get transaction information (from user input,
bank website, etc.) and deliver it to the core system for further handling.

### Storage Plugins

These plugins handle where and how transactions are stored. For example,
it can be a local SQLite database or a decentralized online storage accessed
via an API.

### Output Plugins

These plugins handle output of recorded transactions. This can be a generated
HTML page, a text-based table to be printed in the terminal, or some
other generated file. The purpose here is to show the user their
transactions in a useful manner.

## Configuration

The JSON-format configuration file lives in user directory (or app config
directory, if that's a thing). It controls what plugins should be loaded,
as well as provides account credentials (say, for plugins that require
accessing some resource, like a banking website).

## Transactions

Each transaction must have these fields. If a field is not applicable or not
available for particular a transaction resource, it's value must be `N/A`

* **amount**: positive or negative monetary amount of arbitrary precision
* **currency**: the monetary currency of the `amount`
* **description**: short description of the transaction
* **source-name**: the name of the *source* of this transaction, e.g.
`RBC Bank`, `Capital One`, `Shady Income`. The name is arbitrary and is likely
an account name or financial institution name set by the user in their
configuration file. Note that this is not *who* paid us, but how we learned
about it. If my *Employer XYZ* paid $2000 by direct deposit to *Awesome Bank*,
the `source-name` will be *Awesome Bank* or
*My checking account at Awesome Bank*, **NOT** *Employer XYZ*.
* **source-type**: the type of source where this transaction originated.
Values can be arbitrary, but if the source type fits any of the following,
please use the same exact spelling, spacing, and casing:
`credit card`, `credit line`, `debit card`, `cash`
* **date**: the UTC date and time of the transaction in the format returned
by the `DateTime.now.utc` (e.g. `2016-06-13T12:58:05.022193Z`)
* **score**: the score of the transaction from 0 to 5, indicating how much
the user "enjoyed" the transaction, with 5 indicating the most enjoyment
(loved it) and 0 the least (hated it). Many sources will likely have to
set this field to `N/A` on account of being unable to ascertain how much
the user liked the transaction. The purpose of this field is to let the user
set a sort of a filter for the transactions. For example, if the user is
attempting to lose weight, they can give low scores to foods high in empty
calories and later review their purchasing behaviour with regard to those
transactions. An alternative scoring system can use the *necessity* of the
transaction as a score: if the user had no choice but to perform the
transaction (utilities, rent), they assign value 5, but if the transaction
was more of a indulgence (fast food, cinema), they assign a lower score. When
reviewing transaction history, the user can then evaluate the number and
amounts spent on low-grade transactions and perhaps try to eliminate them in
the future.
