import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app/models/database/users.dart';

import 'all_users.dart';

class DatabaseService{

  final String uid;
  DatabaseService({required this.uid});
  //collection reference
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future updateUserData(String name, String phone,) async{
    return await userCollection.doc(uid).set({
      'name': name,
      'phone_number': phone,
      'summa': 0,
      'groceries_summa': 0,
      'leisure_summa':0,
      'fuel_summa':0,
      'cosmetics_summa':0,
      'health_summa':0


      // 'volunteer_name': volunteer_name,
      // 'surname': surname,
      // 'phone_number': phone_number,
    });
  }

  // Future updateUserDataRef(String name, String role,String user_name, String phone, String pesel, id_ref) async{
  //   return await userCollection.doc(uid).set({
  //     'name': name,
  //     'role': role,
  //     'user_name': user_name,
  //     'phone_number': phone,
  //     'pesel': pesel,
  //     'id_ref': id_ref,
  //
  //
  //
  //
  //     // 'volunteer_name': volunteer_name,
  //     // 'surname': surname,
  //     // 'phone_number': phone_number,
  //   });
  // }

  //users list from snapshot
  List <AllUsers> _refugeeListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return AllUsers(
        name: doc.get('name') ?? '',
        phone: doc.get('phone') ?? '',
        // volunteer_name: doc.get('volunteer_name') ?? '',
        // surname: doc.get('surname') ?? '',
        // phone_number: doc.get('phone_number') ?? '',

      );

    }).toList();

  }

  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      name: snapshot.get('name'),
      phone: snapshot.get('phone'),

      // volunteer_name: snapshot.get('volunteer_name'),
      // volunteer_surname: snapshot.get('volunteer_surname'),
      // phone_number: snapshot.get('phone_number'),
    );
  }

  //get users stream
  Stream<List<AllUsers>>get users{
    return userCollection.snapshots().map(_refugeeListFromSnapshot);
  }


  //get user doc stream
  Stream<UserData> get userData{
    return userCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }

}