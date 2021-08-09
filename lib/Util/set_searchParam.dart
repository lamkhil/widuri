List<String> setSearchParam(String caseString) {
  List<String> caseSearchList = [];
  String temp = "";
  for (int i = 0; i < caseString.length; i++) {
    temp = temp + caseString[i];
    caseSearchList.add(temp);
  }
  return caseSearchList;
}
