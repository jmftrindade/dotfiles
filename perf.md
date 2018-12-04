# Useful perf commands

[perf holy grail](http://www.brendangregg.com/perf.html)

Commands below assume

```bash
$ pid=`pgrep someprocessofinterest`
$ tts=120  # time to sample
```

where the execution of `someprocessofinterest` is appropriately stoped / resumed
using [the getchar hackish
technique](https://yunmingzhang.wordpress.com/2015/06/28/a-quick-tutorial-to-perf/).

## Cache stats.

```bash
$ perf stat -e L1-dcache-loads,L1-dcache-load-misses,L1-dcache-stores,L2-loads,L2-load-misses,L2-stores,LLC-loads,LLC-load-misses,LLC-stores,LLC-prefetches -p $pid sleep ${tts}
```

## Stack trace.
```bash
$ perf record -F 99 -p ${pid} -g -o perf.data --sleep ${tts}
```

### Flame graphs.

Requires downloading [Brendan Gregg's FlameGraph scripts](github.com/brendangregg/FlameGraph). Assuming below is run from directory containing the scripts:

```bash
$ data=path/to/perf.data
$ fn=somefunctionofinterest
$ out=/tmp/stack.svg
$ perf script -i ${data} \
  | ./stackcollapse-perf.pl \
  | grep ${fn} \
  | ./flamegraph.pl > ${out}
```
