class Question {
  String question;
  List<dynamic> tags;
  String description;
  String id;
  String userId;
  bool isClosed;

  Question(
      {this.question,
      this.tags,
      this.id,
      this.userId,
      this.description,
      this.isClosed});
}
