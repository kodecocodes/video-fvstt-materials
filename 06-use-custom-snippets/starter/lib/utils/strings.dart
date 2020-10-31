String camelCaseToTitle(String text) {
  RegExp exp = RegExp(r'(?<=[a-z])[A-Z]');
  // if(exp !== 1)
  String result =
      text.replaceAllMapped(exp, (Match m) => (' ' + m.group(0))).toUpperCase();
  return result;
}
