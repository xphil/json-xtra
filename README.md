# JSON Xtra

Fork of encoding/json from Go v1.24 standard library with some extra features.

It behaves exactly as a standard encoding/json and passes all standard unit tests.

Yes, it was just "cp -r /usr/local/go/src/encoding/json/* ." from standard Go distribution.

## Added Features

- "omitemptyenc" tag for omitting struct field(s) for json.Marshal() only
- "omitemptydec" tag for omitting struct field(s) for json.Unmarshal() only

## Planned Features

- "emptyarr" tag for encoding empty array and slice struct fields as [] instead of "null"

## Why?

When porting services written in one of the older JavaScript framework, we faced with problem that,
when required fields we receive from API calls, read and write from/to database and return as
a response were different.

So, instead of having duplicate data models or overwriting MarshalJSON() and UnmarshalJSON() for
data models, this library fork was created.

It removes a lot of complexity from the code.

## How to run unit-tests

```
./run.sh test
```
