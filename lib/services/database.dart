import '../models/question.dart';
import '../models/user.dart';
import '../models/answer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference questionCollection =
      FirebaseFirestore.instance.collection('questions');

  final CollectionReference answerCollection =
      FirebaseFirestore.instance.collection('answers');

  Future<void> addUserData(
      String name, String usn, int sem, String branch, String email) async {
    return await userCollection
        .doc(uid)
        .set({
          'name': name,
          'usn': usn,
          'sem': sem,
          'branch': branch,
          'email': email,
          'preferredBranch': branch
        })
        .then((value) => print('User Added'))
        .catchError((error) => print(error));
  }

  Future<void> updateUserProfileData(UserModel user) async {
    return await userCollection
    .doc(user.uid)
    .update({
      'name': user.name,
      'usn': user.usn,
      'branch': user.branch,
      'sem': user.sem
    })
    .then((value) => value)
    .catchError((error) => error);
  }

  Future<void> updateAnswer(Answer answer) async {
    return await answerCollection
        .doc(answer.id)
        .update({
          'answer': answer.answer,
        })
        .then((value) => value)
        .catchError((error) => error);
  }

  Future<void> updateQuestion(Question question) async {
    return await questionCollection
        .doc(question.id)
        .update({
          'Question': question.question,
          'description': question.description,
          'Tags': question.tags
        })
        .then((value) => value)
        .catchError((error) => error);
  }

  Future<void> toggleCloseQuestion(Question question) async {
    return await questionCollection
        .doc(question.id)
        .update({
          'isClosed': !question.isClosed,
        })
        .then((value) => value)
        .catchError((error) => error);
  }

  List<UserModel> _userListFromSnapshot(QuerySnapshot snapshot) {
    // var doc = await userCollection.doc(uid).get();
    // print(document['name']);
    return snapshot.docs.map((doc) {
      return UserModel(
        name: doc['name'],
        usn: doc['usn'],
        uid: doc.id,
        email: doc['email'],
        branch: doc['branch'],
        preferredBranch: doc['preferredBranch'],
        sem: doc['sem'].toString(),
      );
    }).toList();
  }

  List<Question> _questionListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      // print(doc.id);
      return Question(
        question: doc['Question'],
        tags: doc['Tags'],
        id: doc.id,
        userId: doc['user'],
        description: doc['description'],
        isClosed: doc['isClosed'],
      );
    }).toList();
  }

  List<Answer> _answerListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Answer(
        answer: doc['answer'],
        qid: doc['question'],
        userId: doc['user'],
        id: doc.id,
      );
    }).toList();
  }

  Future<void> addQuestion(Question question) async {
    print(question.tags);
    return await questionCollection
        .add({
          'Question': question.question,
          'Tags': question.tags,
          'user': question.userId,
          'description': question.description,
          'isClosed': false,
        })
        .then((value) => print('Question Added'))
        .catchError((error) => print(error));
  }

  Future<void> addAnswer(Answer answer) async {
    return await answerCollection
        .add({
          'answer': answer.answer,
          'question': answer.qid,
          'user': answer.userId,
        })
        .then((value) => print(value))
        .catchError((error) => print(error));
  }

  void _userFromSnapshot() {
    print(userCollection.doc(uid).snapshots());
  }

  Stream<List<UserModel>> get userProfile {
    return userCollection.snapshots().map(_userListFromSnapshot);
  }

  Stream<List<Answer>> get answers {
    return answerCollection.snapshots().map(_answerListFromSnapshot);
  }

  Stream<List<Question>> get questions {
    return questionCollection.snapshots().map(_questionListFromSnapshot);
  }
}
