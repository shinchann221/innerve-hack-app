import 'package:cloud_firestore/cloud_firestore.dart';

class DB {
  static void saveToken(String? token) async {
    if (token != null) {
      FirebaseFirestore fireStore = FirebaseFirestore.instance;
      await fireStore
          .collection('localAdmin')
          .doc(token.substring(0, 8))
          .set({'token': token});
    }
  }
}
