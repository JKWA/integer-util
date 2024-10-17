
# IntUtility

This Elixir module provides functionality to convert integers into their English word representation, with support for numbers up to billions. If the number exceeds this limit, the function will return `"Integer too large"`.

## Install dependencies

   Run the following command to fetch the project dependencies:

   ```bash
   mix deps.get
   ```

## Running Tests

To run the test suite, use:

```bash
mix test
```

## Usage in IEx

You can try out the functionality directly in the interactive Elixir shell (`iex`). First, enter the shell:

```bash
iex -S mix
```

Then, you can use the `int_to_string/1` function to convert integers to their English word representation:

```elixir
iex> IntUtility.int_to_string(123)
"one hundred twenty-three"

iex> IntUtility.int_to_string(-4567)
"negative four thousand five hundred sixty-seven"

iex> IntUtility.int_to_string(1_000_000_000_000)
"Integer too large"

iex> IntUtility.int_to_string(987_654_321)
"nine hundred eighty-seven million six hundred fifty-four thousand three hundred twenty-one"
```

## Notes

- This module supports integers of arbitrary size, but limits conversion to numbers up to billions (999,999,999,999). Any number beyond this range will return `"Integer too large"`.
- Negative numbers are handled by prefixing with "negative" before the conversion of the absolute value.
