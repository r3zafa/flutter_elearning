import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreController extends GetxController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final RxList messages = [].obs;

  @override
  void onInit() {
    super.onInit();
    messages.bindStream(getMessageStream());
  }

  addMessage({required String msg, user}) async {
    final newDocRef = _db.collection('msgs').doc();

    final Map<String, dynamic> data = {
      'docRef': newDocRef.id.toString(),
      'sender': user,
      'msg': msg,
      'date': Timestamp.now(),
    };

    await newDocRef.set(data);
  }

  Stream<List> getMessageStream() {
    Stream<QuerySnapshot> snapshots =
        _db.collection('msgs').orderBy('date', descending: false).snapshots();
    Stream<List> stream = snapshots
        .map((query) => query.docs.map((item) => item.data()).toList());

    return stream;
  }

  deleteMsg({required String docRef}) async {
    await _db.collection("msgs").doc(docRef).delete().then(
          (doc) => Get.snackbar(docRef, 'deleted!'),
          onError: (e) => Get.snackbar(docRef, 'delete error! $e'),
        );
  }
}
