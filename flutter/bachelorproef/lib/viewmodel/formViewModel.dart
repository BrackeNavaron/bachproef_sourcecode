
class FormViewModel {

  String text;

  final int maxTextLength = 20;

  bool autoValidate = false;

  String validateTextInput(String value,String valueIsRequired,String maxLengthMessage){
    if(value == null || value.isEmpty){
      return valueIsRequired;
    }else if (value.length > maxTextLength){
      return maxLengthMessage;
    }else{
      text = value;
      return null;
    }
  }

  void clear() {
    autoValidate = false;
    text = "";
  }
}