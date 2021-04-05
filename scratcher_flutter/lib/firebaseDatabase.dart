import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
//collection references
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future addUserData(String email, bool won) async {
    return await usersCollection.doc().set({
      'email': email,
      'won': won,
      'dateTime' : DateTime.now()
    });
  }
}

//   Future getUserList() async {
//     try {
//       await usersCollection.getDocuments().then((querySnapshot) {
//         querySnapshot.documents.forEach((element) {});
//       });
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }
// }
