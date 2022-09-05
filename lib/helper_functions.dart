List<double> getStringAsList(String str) {
  List<double> lst = [];
  for (int i = 0; i < str.length; i++) {
    lst.add(str.codeUnitAt(i).toDouble());
  }
  return lst;
}
