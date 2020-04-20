
class AnimationViewModel {
  bool colorBtnClicked = false;
  bool colorAndTextTogetherClicked = false;
  bool colorAndTextSequenceClicked = false;
  bool colorAndTextDelayedClicked = false;

  void onColorBtnClicked() => colorBtnClicked = !colorBtnClicked;

  void onColorAndTextTogetherBtnClicked() => colorAndTextTogetherClicked = !colorAndTextTogetherClicked;

  void onColorAndTextSequenceBtnClicked() => colorAndTextSequenceClicked = !colorAndTextSequenceClicked;

  void onColorAndTextDelayedClicked() => colorAndTextDelayedClicked = !colorAndTextDelayedClicked;
}