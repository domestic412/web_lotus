String removeBeforeSlash(String string) {
  //Find to index of the first '/'
  int index = string.indexOf('/');

  //If '/' is found, return the substring after it
  if (index != -1) {
    return string.substring(index + 1);
  }

  // If '/' is not found, return the original string
  return string;
}
