class ProjectRequest {
  String id;
  String title;
  String subTitle;
  String description;
  String teamHeadCount;
  List<dynamic> skills;
  String uid;
  bool isClosed;
  List<dynamic> tags;
  String currentTeamHeadcount;

  ProjectRequest({
    this.id,
    this.title,
    this.description,
    this.subTitle,
    this.teamHeadCount,
    this.skills,
    this.uid,
    this.isClosed,
    this.currentTeamHeadcount,
    this.tags,
  });
}
