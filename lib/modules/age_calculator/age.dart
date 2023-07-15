class Age {
  static int ages = 0;
  static cal(int p) {
    int i = p;
    ages = DateTime.now().year - i;
  }
}
