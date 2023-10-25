// ignore_for_file: file_names

class RepoModel {
  String repoName;
  String url;
  String type;
  String? createDate;
  String? updateDate;
  String? pushDate;

  RepoModel({
    required this.repoName,
    required this.url,
    required this.type,
    this.createDate,
    this.updateDate,
    this.pushDate,
  });
}
