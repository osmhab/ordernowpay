import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBuA2X01iQl2ahT4p01io1y1HLI8h2DDRY",
            authDomain: "ordernowpay-58d66.firebaseapp.com",
            projectId: "ordernowpay-58d66",
            storageBucket: "ordernowpay-58d66.appspot.com",
            messagingSenderId: "349869952043",
            appId: "1:349869952043:web:933d5eb3514163b761ee6e",
            measurementId: "G-GL8WRHYYES"));
  } else {
    await Firebase.initializeApp();
  }
}
