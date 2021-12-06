# CosmWasm builder

## Building

Start by building the image: 

```
docker build -t build-cosmwasm .
```

This will do an initial build to cache the cargo packages. 

## Running 

With the container built, you can run the follow command to compile and run unit tests: 

```
docker run -v $(pwd)/my-first-contract:/usr/src/myapp:rw build-cosmwasm
```

This is where you can use the volume mount to point the container to a different contract, or updated logic. 

## Example output

```
$ time docker run -v $(pwd)/my-first-contract:/usr/src/myapp:rw build-cosmwasm
 Downloading crates ...
  Downloaded cosmwasm-schema v0.16.0
   Compiling cosmwasm-schema v0.16.0
   Compiling my-first-contract v0.1.0 (/usr/src/myapp)
    Finished test [unoptimized + debuginfo] target(s) in 2.70s
     Running unittests (/tmp/debug/deps/my_first_contract-df8135d8b7d9b826)

running 3 tests
test contract::tests::reset ... ok
test contract::tests::increment ... ok
test contract::tests::proper_initialization ... ok

test result: ok. 3 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

   Doc-tests my-first-contract

running 0 tests

test result: ok. 0 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

docker run -v $(pwd)/my-first-contract:/usr/src/myapp:rw build-cosmwasm  0.12s user 0.13s system 6% cpu 3.961 total
```

As you can see, the total runtime was `3.961` seconds. I found this to be standard as long as there aren't large changes in the included dependencies. 