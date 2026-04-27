import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/note.dart';

class NoteService {
  final CollectionReference _notesCollection =
      FirebaseFirestore.instance.collection('notes');

  // Get all notes as a stream, ordered by createdAt descending
  Stream<List<Note>> getNotes() {
    return _notesCollection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Note.fromFirestore(doc)).toList();
    });
  }

  // Add a new note
  Future<void> addNote(Note note) async {
    await _notesCollection.add(note.toMap());
  }

  // Update an existing note
  Future<void> updateNote(String id, Note note) async {
    await _notesCollection.doc(id).update(note.toMap());
  }

  // Delete a note
  Future<void> deleteNote(String id) async {
    await _notesCollection.doc(id).delete();
  }
}
