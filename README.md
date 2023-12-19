# Flutter one way state management. Inspired by redux.

```mermaid 
flowchart LR
Widget --> SideEffect
SideEffect --> stores
subgraph stores
  Store...
end
stores --> SideEffect
stores ---> Widget

SideEffect --> Repository
```

## Features
One way state management. Thin wrapper.
Use StateNotifier and RiverPods.

## Getting started
Add `baguette` and [`flutter_riverpod`](https://github.com/rrousselGit/riverpod) to Pubspec.yaml.

## Usage
`Store` and `SideEffect` in the upper figure use this library.`State` extends `BState`, so that a `Model` is called from `State`.
. `State` should call `Model`.
`State` and `Model` uses `freezed` etc., `Repository` could be anything.
`Store` subscription uses `Riverpods`.
See the example for details.

## Additional information

```
baguette
    git: https://github.com/mi6ock/baguette.git
```
