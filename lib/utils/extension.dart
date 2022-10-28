extension GithubMakeUsername on String {
  String toGithubUsername() {
    String username = this;
    List<String> splitName = split(" ");
    if (splitName.length > 1) {
      username = splitName[0] + splitName[1];
    }
    return username.toLowerCase().toString();
  }
}
