// Generated by CoffeeScript 1.9.2
var isalphaorspace;

isalphaorspace = function(n) {
  return n >= 'a' && n <= 'z' || n >= 'A' && n <= 'Z' || n === ' ' || n === '\t';
};

module.exports = function(s) {
  var clip, i, key, len, meta, value;
  len = s.length;
  clip = 0;
  i = 0;
  meta = {};
  while (isalphaorspace(s[i])) {
    if (i === len) {
      break;
    }
    while (i < len && isalphaorspace(s[i])) {
      i++;
    }
    if (i === len) {
      break;
    }
    if (s[i] !== ':') {
      break;
    }
    key = s.substring(clip, i);
    i++;
    clip = i;
    while (clip < len && s[clip] !== '\n') {
      clip++;
    }
    value = s.substring(i, clip);
    meta[key.trim()] = value.trim();
    clip++;
    i = clip;
  }
  return {
    meta: meta,
    text: s.substr(clip)
  };
};