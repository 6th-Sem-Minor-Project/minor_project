class ProjectRequest {
  String id;
  String title;
  String description;
  String teamHeadCount;
  List<dynamic> skills;
  String uid;
  bool isClosed;

  ProjectRequest({
    this.id
    this.title,
    this.description,
    this.teamHeadCount,
    this.skills,
    this.uid,
    this.isClosed,
  });
}
