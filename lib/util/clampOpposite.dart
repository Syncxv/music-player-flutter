double weirdClamp(double num, double max, double min) {
  if (num > max) return min;
  if (num < min) return max;
  return min;
}
