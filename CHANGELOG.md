# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [2.0.2] - 2025-06-27

### Fixed
- Give each `Pawn` instance its own `HTTP::Client` instance

## [2.0.1] - 2025-06-06

### Fixed
- Fix compile error calling `.compare_versions` with `Pawn::VERSION`

## [2.0.0] - 2025-04-19

### Changed
- Convert `Pawn` into a `struct`

### Fixed
- Use the same `HTTP::Client` object for all `Pawn` instances

## [1.0.3] - 2024-08-16

### Fixed
- Minor performance improvement

## [1.0.2] - 2024-08-15

### Fixed
- Replace `require "http"` with `require "http/client"`

## [1.0.1] - 2024-08-15

### Fixed
- Add missing `require "http"`

## [1.0.0] - 2023-05-29

### Added
- First stable release

## [0.2.0] - 2023-05-02

### Changed
- Bump minimum required Crystal version to 1.3

### Removed
- Remove `GrottoPress/hapi` shard

### Fixed
- Fix linker error with OpenSSL 3.0

## [0.1.2] - 2022-02-26

### Added
- Ensure support for *Crystal* v1.3.0

## [0.1.1] - 2021-11-22

### Added
- Add support for *Crystal* v1.2
- Add support for *Crystal* v1.1

## [0.1.0] - 2021-08-27

### Added
- Initial public release
