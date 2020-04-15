
class FormViewModel {

  String text;

  final int maxTextLength = 20;

  bool autoValidate = false;

  bool switchOn = false;

  bool checkboxChecked = false;

  List<int> dropDownItems = [1,2,3,4,5];

  int dropDownValue = 1;

  int radioGroupValue = 0;

  double sliderMax = 100;
  double sliderMin = 0.0;
  double sliderValue = 0.0;

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

  void onSwitchChanged() => switchOn = !switchOn;

  void onDropDownChanged(int value) => dropDownValue = value;

  void onCheckboxChanged() => checkboxChecked = !checkboxChecked;

  void onRadioChanged(int value) => radioGroupValue = value;

  void onSliderChanged(double value) => sliderValue = value;
}