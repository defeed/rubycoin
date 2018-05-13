# Simple blockchain implementation in Ruby

## Usage

```
block0 = RubyCoin::Block.new("Hello blockchain", '0'*64)
block1 = RubyCoin::Block.new("Mining blocks like noone's business", block0.hash)
block2 = RubyCoin::Block.new("Kthxbye", block1.hash)
```

