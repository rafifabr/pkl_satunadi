// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:pkl_satunadi/profile.dart'; // Sesuaikan dengan model UserProfile

// class UserProfileProvider with ChangeNotifier {
//   UserProfile? _userProfile;
//   bool _isLoading = false;
//   String? _error;

//   UserProfile? get userProfile => _userProfile;
//   bool get isLoading => _isLoading;
//   String? get error => _error;
//   bool get hasError => _error != null;

//   Future<void> fetchUserProfile() async {
//     _isLoading = true;
//     _error = null;
//     notifyListeners();

//     try {
//       User? currentUser = FirebaseAuth.instance.currentUser;
//       if (currentUser == null) {
//         throw Exception('User not authenticated.');
//       }

//       final userDoc = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(currentUser.uid)
//           .get();

//       if (userDoc.exists) {
//         _userProfile = UserProfile.fromSnapshot(
//             userDoc); // Pastikan model UserProfile.fromSnapshot telah didefinisikan
//       } else {
//         throw Exception('User profile not found.');
//       }
//     } catch (e) {
//       _error = 'Error fetching user profile: $e';
//       print(_error);
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
// }
