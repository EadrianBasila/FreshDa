import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String firstName;
  final String lastName;
  final String uid;
  final String username;
  final int milkfishScan;
  final int mackarelScan;
  final int tilapiaScan;
  final int redsnapperScan;

  const User({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.uid,
    required this.email,
    required this.milkfishScan,
    required this.mackarelScan,
    required this.tilapiaScan,
    required this.redsnapperScan,
  });

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot["username"],
      firstName: snapshot["firstName"],
      lastName: snapshot["lastName"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      milkfishScan: snapshot["milkfishScan"],
      mackarelScan: snapshot["mackarelScan"],
      tilapiaScan: snapshot["tilapiaScan"],
      redsnapperScan: snapshot["redsnapperScan"],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "firstName": firstName,
        "lastName": lastName,
        "uid": uid,
        "email": email,
        "milkfishScan": milkfishScan,
        "mackarelScan": mackarelScan,
        "tilapiaScan": tilapiaScan,
        "redsnapperScan": redsnapperScan,
      };
}
