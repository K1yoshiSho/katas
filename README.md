# Solving coding katas in Dart language using TDD   

### Coverage
**Use**: `dart run test --coverage=./coverage && dart pub global run coverage:format_coverage --packages=.dart_tool/package_config.json --report-on=lib --lcov -o ./coverage/lcov.info -i ./coverage`

# Arlo's Commit Notation Cheat Sheet

## Risk Levels

| Risk Level             | Code        | Example                         | Meaning                                              |
|------------------------|-------------|---------------------------------|------------------------------------------------------|
| **Known safe**         | lowercase   | `r - Extract method Applesauce` | Addresses all known and unknown risks.               |
| **Validated**          | uppercase   | `R - Extract method Applesauce` | Addresses all known risks.                           |
| **Risky**              | uppercase!! | `R!! Extract method Applesauce` | Some known risks remain unverified.                  |
| **(Probably) Broken**  | uppercase** | `R** Start extracting method`   | No risk attestation.                                 |

## Intention Prefixes

| Prefix | Name         | Intention                                                      |
|--------|--------------|----------------------------------------------------------------|
| F      | Feature      | Change or extend one aspect of program behavior without altering others. |
| B      | Bugfix       | Repair one existing, undesirable program behavior without altering any others. |
| R      | Refactoring  | Change implementation without changing program behavior.      |
| D      | Documentation| Change something which communicates to team members and does not impact program behavior. |

## Detailed Notations

### Feature Notation

| Code   | Known Approaches |
|--------|------------------|
| `f - ` | None known       |
| `F - ` | Change <= 8 LoC, fully unit tested, includes new/changed unit tests. |
| `F!!`  | Includes unit tests for new behavior. |
| `F**`  | No automatic tests, or unfinished implementation. |

### Bugfix Notation

| Code   | Known Approaches |
|--------|------------------|
| `b - ` | None known       |
| `B - ` | Reviewed with customer rep, Change <= 8 LoC, original behavior captured in a unit test, includes 1 changed unit test. |
| `B!!`  | Includes unit tests for new behavior. |
| `B**`  | No automatic tests, or unfinished implementation. |

### Refactoring Notation

| Code   | Known Approaches |
|--------|------------------|
| `r - ` | Provable refactoring or test-supported procedural refactoring within test code. |
| `R - ` | Test-supported Procedural Refactoring. |
| `R!!`  | Single refactoring, but executed by editing code or without whole-project test coverage. |
| `R**`  | Remodeled by editing code. |

### Documentation Notation

| Code   | Known Approaches |
|--------|------------------|
| `d - ` | Developer-visible documentation, not in a source file, or verified to generate byte-identical compilation. |
| `D - ` | Dev-impacting only, but changes compilation or process. |
| `D!!`  | Alters an important process. |
| `D**`  | Trying out a process change for information gain. |

## Refactoring Approaches

| Type                                 | Description                                             |
|--------------------------------------|---------------------------------------------------------|
| Provable Refactorings                | Automated or scripted manual refactoring with verification. |
| Test-supported Procedural Refactorings | Named refactoring, highly tested product or new uncalled code, follows published steps. |

## Small Features and Bug Fixes

- Changes > 8 lines of code are high risk.
- Refactor before adding small features or fixes.

## End-User Documentation

- Use feature, bugfix, or refactoring codes accordingly.
