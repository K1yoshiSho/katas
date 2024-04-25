/// The function `solution` calculates and returns the sum of all multiples
/// of 3 or 5 that are below a given number.
int solution(int number) {
  // If the passed number is less than 3, return 0 as there are no multiples of 3 or 5 below it
  if (number < 3) return 0;

  // This variable `sum` stores the total sum of the multiples of 3 or 5
  int sum = 0;

  // Start a loop from 3 up to (but not including) the passed number
  for (int i = 3; i < number; i++) {
    // If the current number `i` is divisible by 3 or 5, then it's a multiple of 3 or 5
    if (i % 3 == 0 || i % 5 == 0) {
      // Add this multiple to the overall `sum`
      sum += i;
    }
  }

  // Return the final computed sum
  return sum;
}
