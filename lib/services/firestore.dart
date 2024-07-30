import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // get colletion das notas
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  //CREATE
  Future<void> addNote(String note) {
    return notes.add({
      'note': note,
      'timestamp': DateTime.timestamp(),
    });
  }

  //READ
  Stream<QuerySnapshot> getNotesStream() {
    final notesStream =
        notes.orderBy('timestamp', descending: true).snapshots();
    return notesStream;
  }

  //UPDATE

  Future<void> updateNote(String docID, String newNote) {
    return notes.doc(docID).update({
      'note': newNote,
      'timestamp': DateTime.timestamp(),
    });

    //DELETE
  }

  Future<void> deleteNote(String docID) {
    return notes.doc(docID).delete();
  }
}
