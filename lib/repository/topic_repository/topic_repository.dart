import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:quizz_app/features/authenticaiton/models/TopicsModel.dart';
import 'package:quizz_app/features/authenticaiton/models/WordModel.dart';

class TopicRepository extends GetxService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<String> createTopic(TopicsModel topic) async {
    DocumentReference docRef =
        await _db.collection('Topics').add(topic.toJson());
    return docRef.id; // Return the ID of the newly created topic
  }

  Future<void> addWordToTopic(String topicId, WordModel word) async {
    await _db
        .collection('Topics')
        .doc(topicId)
        .collection('Words')
        .add(word.toJson());
  }
}
