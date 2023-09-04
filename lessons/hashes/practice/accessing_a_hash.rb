suitcase = {
  "socks" => 4,
  "pants" => 1
}

# How would we get the value of:

# 1. "socks"
p suitcase["socks"]
# 2. "pants"
p suitcase["pants"]
# 3. All of the values in this hash.
p suitcase.values
# How would we get the keys of the above hash?
p suitcase.keys