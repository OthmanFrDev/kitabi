import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:kitabi_app/screens/sign_in.dart';

Future<bool> loginIn(String email, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        //.createUserWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    print(e.toString());
    return false;
  } catch (e) {
    print(e.toString());
    return false;
  }
}
Future signOut()  async {
  try{
    await  FirebaseAuth.instance.signOut();
    Get.to(SignIn(), transition: Transition.rightToLeftWithFade);
    return true;
  }catch(e){
    print(e.toString());
    return null;
  }
}