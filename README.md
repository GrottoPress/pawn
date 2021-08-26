# Pawn

**Pawn** is a low-level API client for [*Pwned Passwords*](https://haveibeenpwned.com/Passwords).

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     pawn:
       github: GrottoPress/pawn
   ```

1. Run `shards update`

1. Require *Pawn* in your app/library:

   ```crystal
   # ...
   require "pawn"
   # ...
   ```

## Usage

1. Check if a password appears in any breach:

   ```crystal
   Pawn.pwned?("password") # <= true
   ```

1. Find how many times a password appears in breaches:

   ```crystal
   Pawn.count("password") # <= 3861493
   ```

Either method accepts an optional `padding`, a `Bool` argument that sends a `Add-Padding` header along with the request to *Pwned Passwords* API.

## Development

Run tests with `crystal spec`.

## Contributing

1. [Fork it](https://github.com/GrottoPress/pawn/fork)
1. Switch to the `master` branch: `git checkout master`
1. Create your feature branch: `git checkout -b my-new-feature`
1. Make your changes, updating changelog and documentation as appropriate.
1. Commit your changes: `git commit`
1. Push to the branch: `git push origin my-new-feature`
1. Submit a new *Pull Request* against the `GrottoPress:master` branch.
