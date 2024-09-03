// class SignupEmailPasswordFailure {
//   final String message;
//
// const SignupEmailPasswordFailure([
//     this.message= 'An unknown Error Occured'
//   ]);
//
// factory SignupEmailPasswordFailure.code(String code){
//   switch(code){
//     case 'weak-password' : return SignupEmailPasswordFailure('Please enter a strong Password');
//     case 'invalid-email' : return SignupEmailPasswordFailure('Please enter a valid Email');
//     case 'email-already-in-use' : return SignupEmailPasswordFailure('An account already exists for this email');
//     case 'user-disabled' : return SignupEmailPasswordFailure('This user has been disabled');
//     default: return SignupEmailPasswordFailure();
//   }
// }
// }