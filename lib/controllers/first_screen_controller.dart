class FirstScreenController {
  String name = '';
  String palindrome = '';

  bool isPalindrome() {
    int start = 0;
    int end = palindrome.length - 1;

    while (start < end) {
      if (palindrome[start].toLowerCase() != palindrome[end].toLowerCase()) {
        return false;
      }
      start++;
      end--;
    }
    return true;
  }
}
