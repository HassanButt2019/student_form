




mixin InputValidationMixin {
 bool isFieldEmpty(String fieldValue) => fieldValue.isEmpty ?true : false ;
 
 
  bool isPasswordValid(String password) {
    if(password.length >= 6){
      return true;
    }
    return false;
  }

  bool isEmailValid(String email) {
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(email);
  }
}

      