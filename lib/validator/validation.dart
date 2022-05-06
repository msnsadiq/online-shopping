String? validateEmail(String value){
  if(value.isEmpty || value == null){
    return "email is required";
  }else if(value.length <= 10 || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
    return "Not a valid email";
  }
  return null;
}