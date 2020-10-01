import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirestoreService {
  // obtener notas
  Stream<QuerySnapshot> notas(String uid) {
    return Firestore.instance
        .collection('notas')
        .where('uid', isEqualTo: uid)
        .snapshots();
  }

  // agregar notas
  Future agregarNota(
      String titulo, String descripcion, String contenido) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    Firestore.instance.collection('notas').document().setData({
      'titulo': titulo,
      'descripcion': descripcion,
      'contenido': contenido,
      'uid': sp.getStringList('user')[0]
    });
  }

  // borrar notas
  Future borrarNota(String idNota) {}
}
