import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future addUserData(String email, bool won) async {
    return await usersCollection
        .doc()
        .set({'email': email, 'won': won, 'dateTime': DateTime.now()});
  }

  Future getUserList() async {
    List itemsList = [];

    try {
      await usersCollection.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          element.id;
          itemsList.add(element.data());
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
