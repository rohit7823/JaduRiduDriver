enum Option {
  popPrevious,
  popAll,
  none;
}

class NavigationOption {
  Option option;
  NavigationOption({required this.option});
}
