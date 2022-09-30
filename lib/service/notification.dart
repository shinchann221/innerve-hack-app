import 'package:cloud_firestore/cloud_firestore.dart';

import '../global.dart';

class Notification {
  static void sendMessage() async {
    List<DocumentSnapshot> docs;
    QuerySnapshot snap;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    snap = await firestore.collection('localAdmin').get();
    docs = snap.docs;
    for (DocumentSnapshot doc in docs) {
      Globals.fcm.sendMessage(to: doc.get('token'), data: {});
    }
  }
}
