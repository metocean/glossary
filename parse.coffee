isalphaorspace = (n) -> n >= 'a' and n <= 'z' or n >= 'A' and n <= 'Z' or n is ' ' or n is '\t'

module.exports = (s) ->
  len = s.length
  clip = 0
  i = 0
  meta = {}
  while isalphaorspace s[i]
    break if i is len
    i++ while i < len and isalphaorspace s[i]
    break if i is len
    break if s[i] isnt ':'
    key = s.substring clip, i
    i++
    clip = i
    clip++ while clip < len and s[clip] isnt '\n'
    value = s.substring i, clip
    meta[key.trim()] = value.trim()
    clip++
    i = clip
  meta: meta
  text: s.substr clip