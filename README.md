# php dotenv loaders benchmark

This is a very small script to show the execution time of dotenv loaders for 10000 executions with 1 iteration.

## What is tested ?

Every loader has to reach the same point, so opening the .env file, parsing it and loading the result into $_ENV and $_SERVER.

## Where does my results come from ?

But feel free to make yours:
edit docker-composer.yml command, revolutions=10000, iterations=1
```yaml
version: '2'

services:
  benchmark:
    build:
      context: ./
      dockerfile: Dockerfile
    command: php vendor/bin/phpbench run DotenvBench.php --report=aggregate --revs=10000 --iterations=1
```
```bash
# run the benchmark
docker-composer up --build
```
update composer.json for specific package version
```json
"require": {
        "josegonzalez/dotenv": "@dev",
        "vlucas/phpdotenv": "@dev",
        "rfussien/dotenv": "@dev",
        "symfony/dotenv": "@dev",
        "devcoder-xyz/php-dotenv": "@dev",
        "phpbench/phpbench": "@dev"
    }
```

## Comparaison

### [josegonzalez/php-dotenv](https://github.com/josegonzalez/php-dotenv)
 - actual version: @dev
 - 10.000 loops execution time: **149.284μs**

### [vlucas/phpdotenv](https://github.com/vlucas/phpdotenv)
 - actual version: @dev
 - 10.000 loops execution time: **400.453μs**

### [vlucas/phpdotenv](https://github.com/vlucas/phpdotenv)
 - actual version: ~2.0
 - 10.000 loops execution time: **85.049μs**

### [symfony/dotenv](https://github.com/symfony/dotenv)
 - actual version: @dev
 - 10.000 loops execution time: **141.451μs**

### [rfussien/dotenv](https://github.com/rfussien/dotenv)
 - actual version: @dev
 - 10.000 loops execution time: **46.604μs**

### [devcoder-xyz/php-dotenv](https://github.com/devcoder-xyz/php-dotenv)
 - actual version: @dev
 - 10.000 loops execution time: **36.270μs**

## Raw results

```bash
| PHPBench (1.2.0) running benchmarks...
| with configuration file: /tmp/phpbench.json
| with PHP version 8.0.12, xdebug ❌, opcache ❌
|
| \DotenvBench
|
    benchJosegonzalez.......................I0 - Mo149.284μs (±0.00%)
    benchVlucas@~2.0........................I0 - Mo85.049μs (±0.00%)
    benchVlucas@dev.........................I0 - Mo403.774μs (±0.00%)
    benchSymfony............................I0 - Mo144.216μs (±0.00%)
    benchRfussien...........................I0 - Mo49.428μs (±0.00%)
    benchDevcoderxyz........................I0 - Mo39.376μs (±0.00%)
|
| Subjects: 5, Assertions: 0, Failures: 0, Errors: 0
| +-------------+-------------------+-----+-------+-----+----------+-----------+--------+
| | benchmark   | subject           | set | revs  | its | mem_peak | mode      | rstdev |
| +-------------+-------------------+-----+-------+-----+----------+-----------+--------+
| | DotenvBench | benchJosegonzalez |     | 10000 | 1   | 39.390mb | 149.284μs | ±0.00% |
| | DotenvBench | benchVlucas@~2.0  |     | 10000 | 1   | 1.027mb  | 85.049μs  | ±0.00% |
| | DotenvBench | benchVlucas@dev   |     | 10000 | 1   | 1.258mb  | 403.774μs | ±0.00% |
| | DotenvBench | benchSymfony      |     | 10000 | 1   | 1.057mb  | 144.216μs | ±0.00% |
| | DotenvBench | benchRfussien     |     | 10000 | 1   | 1.027mb  | 49.428μs  | ±0.00% |
| | DotenvBench | benchDevcoderxyz  |     | 10000 | 1   | 1.027mb  | 39.376μs  | ±0.00% |
| +-------------+-------------------+-----+-------+-----+----------+-----------+--------+
```
