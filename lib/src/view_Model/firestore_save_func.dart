import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//----------Authentication Id-------------------------------------
FirebaseAuth auth = FirebaseAuth.instance;

//------------This Func is used to Create Field in Firebase------------------------
//---------------------------------------------------------------------------------
Future<void> createFieldinFirebase() async {
  if (auth.currentUser != null) {
    String userId = auth.currentUser!.uid;
    final users = FirebaseFirestore.instance.collection('users').doc(userId);

    final userssnap = await users.get();

    if (!userssnap.exists) {
      await users.set({
        'Favorite': [],
        'Recent_Booking': [],
        'Reward_Score': 0, 'Checkin_Status': false,
        'VIP_Verification': false,
        'User_Details': [],
        'Bug_Report': [],
        'Hotel_Name_Fav': [], 'Hotel_Name_Rec': [],
        'Booking_Details': [],
        'Check-IN_Details': [],

        // Add more fields as needed
      });
    }
  }
}

//------------------------------------------------------------------------------
//--------------This Func is used to Save to Favorites in Firebase--------------------
//------------------------------------------------------------------------------------
Future<void> Save_Item_to_Favorite(
  String Hotel_Name,
  int Price,
  String thumbnail,
  double Rating,
  String Description,
) async {
  try {
    if (auth.currentUser != null) {
      String userId = auth.currentUser!.uid;

      // Reference to the collection 'users' in Firestore
      final users = FirebaseFirestore.instance.collection('users').doc(userId);

      final userssnap = await users.get();
      // Replace 'userData' with the document name or ID
      // Here, a new document will be created with the user ID

      if (userssnap.exists) {
        await users.update({
          'Favorite': FieldValue.arrayUnion([
            {
              'Hotel': Hotel_Name,
              'Price': Price,
              'thumbnail': thumbnail,
              'Rating': Rating,
              'Description': Description,
            }
          ]),
          'Hotel_Name_Fav': FieldValue.arrayUnion([Hotel_Name]),
          // Add more fields as needed
        });
      }
      print('Data saved successfully for user ID: $userId');
    } else {
      print('User is not logged in.');
    }
  } catch (e) {
    print('Error saving data: $e');
  }
}

Future<void> Remove_Item_to_Favorite(
  String Hotel_Name,
  int Price,
  String thumbnail,
  double Rating,
  String Description,
) async {
  try {
    if (auth.currentUser != null) {
      String userId = auth.currentUser!.uid;

      // Reference to the collection 'users' in Firestore
      final users = FirebaseFirestore.instance.collection('users').doc(userId);

      final userssnap = await users.get();
      // Replace 'userData' with the document name or ID
      // Here, a new document will be created with the user ID

      if (userssnap.exists) {
        await users.update({
          'Favorite': FieldValue.arrayRemove([
            {
              'Hotel': Hotel_Name,
              'Price': Price,
              'thumbnail': thumbnail,
              'Rating': Rating,
              'Description': Description,
            }
          ]),
          'Hotel_Name_Fav': FieldValue.arrayUnion([Hotel_Name]),
          // Add more fields as needed
        });
      }
      print('Data saved successfully for user ID: $userId');
    } else {
      print('User is not logged in.');
    }
  } catch (e) {
    print('Error saving data: $e');
  }
}

//------------------------------------------------------------------------------
//--------------This Func is used to Save to Recent booking in Firebase--------------------
//------------------------------------------------------------------------------------
Future<void> Save_Item_to_Recent_Booking(
  String Hotel_Name,
  int Price,
  String thumbnail,
  double Rating,
  String Description,
) async {
  try {
    if (auth.currentUser != null) {
      String userId = auth.currentUser!.uid;

      // Reference to the collection 'users' in Firestore
      final users = FirebaseFirestore.instance.collection('users').doc(userId);

      final userssnap = await users.get();
      // Replace 'userData' with the document name or ID
      // Here, a new document will be created with the user ID

      if (userssnap.exists) {
        await users.update({
          'Favorite': FieldValue.arrayUnion([
            {
              'Hotel': Hotel_Name,
              'Price': Price,
              'thumbnail': thumbnail,
              'Rating': Rating,
              'Description': Description,
            }
          ]),
          'Hotel_Name_Rec': FieldValue.arrayUnion([Hotel_Name]),

          // Add more fields as needed
        });
      }
      print('Data saved successfully for user ID: $userId');
    } else {
      print('User is not logged in.');
    }
  } catch (e) {
    print('Error saving data: $e');
  }
}

//------------------------------------------------------------------------------
//--------------This Func is used to Save Reward--------------------
//------------------------------------------------------------------------------------
Future<void> Save_Reward(Int Reward) async {
  try {
    if (auth.currentUser != null) {
      String userId = auth.currentUser!.uid;

      // Reference to the collection 'users' in Firestore
      final users = FirebaseFirestore.instance.collection('users').doc(userId);

      final userssnap = await users.get();
      // Replace 'userData' with the document name or ID
      // Here, a new document will be created with the user ID
      int Reward_scores = userssnap['Reward_Score'] + Reward;

      if (userssnap.exists) {
        await users.update({
          'Rewards_Score': Reward_scores

          // Add more fields as needed
        });
      }
      print('Data saved successfully for user ID: $userId');
    } else {
      print('User is not logged in.');
    }
  } catch (e) {
    print('Error saving data: $e');
  }
}

//------------------------------------------------------------------------------
//--------------This Func is used to Save to User Details --------------------
//------------------------------------------------------------------------------------
Future<void> Save_User_Details(
  String Name,
  int Age,
  String Personal_Id,
  String About,
) async {
  try {
    if (auth.currentUser != null) {
      String userId = auth.currentUser!.uid;

      // Reference to the collection 'users' in Firestore
      final users = FirebaseFirestore.instance.collection('users').doc(userId);

      final userssnap = await users.get();
      // Replace 'userData' with the document name or ID
      // Here, a new document will be created with the user ID

      if (userssnap.exists) {
        await users.update({
          'User_Details': FieldValue.arrayUnion([
            {
              'Name': Name,
              'Age': Age,
              'Personal_Id': Personal_Id,
              'About': About,
            }
          ]),
          // Add more fields as needed
        });
      }
      print('Data saved successfully for user ID: $userId');
    } else {
      print('User is not logged in.');
    }
  } catch (e) {
    print('Error saving data: $e');
  }
}

//------------------------------------------------------------------------------
//--------------This Func is used to Save Bug Report--------------------
//------------------------------------------------------------------------------------
Future<void> Save_Bug_Report(
  String Subject,
  String Description,
) async {
  try {
    if (auth.currentUser != null) {
      String userId = auth.currentUser!.uid;

      // Reference to the collection 'users' in Firestore
      final users = FirebaseFirestore.instance.collection('users').doc(userId);

      final userssnap = await users.get();
      // Replace 'userData' with the document name or ID
      // Here, a new document will be created with the user ID

      if (userssnap.exists) {
        await users.update({
          'Bug_Report': FieldValue.arrayUnion([
            {
              'Subject': Subject,
              'Description': Description,
            }
          ]),
          // Add more fields as needed
        });
      }
      print('Data saved successfully for user ID: $userId');
    } else {
      print('User is not logged in.');
    }
  } catch (e) {
    print('Error saving data: $e');
  }
}

//------------------------------------------------------------------------------
//--------------This Func is used to Save CheckIn / Checkout Status--------------------
//------------------------------------------------------------------------------------
Future<void> Save_Checkin_Status(
  bool checkIn,
) async {
  try {
    if (auth.currentUser != null) {
      String userId = auth.currentUser!.uid;

      // Reference to the collection 'users' in Firestore
      final users = FirebaseFirestore.instance.collection('users').doc(userId);

      final userssnap = await users.get();
      // Replace 'userData' with the document name or ID
      // Here, a new document will be created with the user ID

      if (userssnap.exists) {
        await users.update({
          'Checkin_Status': checkIn
          // Add more fields as needed
        });
      }
      print('Data saved successfully for user ID: $userId');
    } else {
      print('User is not logged in.');
    }
  } catch (e) {
    print('Error saving data: $e');
  }
}

Future<void> Save_Booking_Details(
    String Hotel_Name,
    int Price,
    String Checkin_Date,
    String Checkout_Date,
    String Description,
    int numberofperson,
    int numberofrooms,
    String category) async {
  try {
    if (auth.currentUser != null) {
      String userId = auth.currentUser!.uid;

      // Reference to the collection 'users' in Firestore
      final users = FirebaseFirestore.instance.collection('users').doc(userId);

      final userssnap = await users.get();
      // Replace 'userData' with the document name or ID
      // Here, a new document will be created with the user ID

      if (userssnap.exists) {
        await users.update({
          'Favorite': FieldValue.arrayUnion([
            {
              'Hotel': Hotel_Name,
              'Price': Price,
              'Checkin': Checkin_Date,
              'Checkout': Checkout_Date,
              'Description': Description,
              'numberofperson': numberofperson,
              'numberofrooms': numberofrooms,
              'category': category
            }
          ]),
          'Hotel_Name_Fav': FieldValue.arrayUnion([Hotel_Name]),
          // Add more fields as needed
        });
      }
      print('Data saved successfully for user ID: $userId');
    } else {
      print('User is not logged in.');
    }
  } catch (e) {
    print('Error saving data: $e');
  }
}
