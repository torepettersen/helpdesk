# Helpdesk

## Reproduce many to manny error

Setup the database and start iex
```bash
$ mix ecto.setup
$ iex -S mix
```

```elixir
iex> job = Ash.create!(Helpdesk.Support.Job, %{title: "Backend Developer"})
iex> job = Ash.update!(job, %{programming_languages: [%{name: "Elixir"}])
iex> job = Ash.update!(job, %{programming_languages: [%{name: "Elixir"}])
```
