import 'package:bachelorproef/generated/i18n.dart';
import 'package:bachelorproef/viewmodel/formViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class FormWidget extends StatefulWidget {

  @override
  _FormWidgetState createState() => _FormWidgetState(Injector.getInjector().get<FormViewModel>());
}

class _FormWidgetState extends State<FormWidget> {
  _FormWidgetState(this.viewModel): assert(viewModel != null);

  final FormViewModel viewModel;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _textEditingController = TextEditingController();

  String _numberToText(int number){
    switch(number){
      case 1: return S.of(context).one;
      case 2: return S.of(context).two;
      case 3: return S.of(context).three;
      case 4: return S.of(context).four;
      case 5: return S.of(context).five;
    }
    return "???";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(S.of(context).forms),
      ),
      body: SingleChildScrollView(
        child: MediaQuery.of(context).orientation == Orientation.portrait ? _buildPortrait(context) : _buildLandscape(context),
      ),
    );
  }

  Widget _buildPortrait(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: S.of(context).form_text_hint
              ),
              controller: _textEditingController,
              validator: (value) => viewModel.validateTextInput(value,
                  S.of(context).form_text_required,
                  S.of(context).form_text_max_length("${viewModel.maxTextLength}")
              ),
              autovalidate: viewModel.autoValidate,
              onChanged: (value)=> setState((){
                viewModel.autoValidate = true;
              }),
            ),
            SwitchListTile(
              title: Text(viewModel.switchOn ? S.of(context).form_switch_on : S.of(context).form_switch_off),
              onChanged: (value) => setState(() {
                viewModel.onSwitchChanged();
              }),
              value: viewModel.switchOn,
            ),
            Row(
              children: <Widget>[
                SizedBox(width: 10),
                DropdownButton(
                  value: viewModel.dropDownValue,
                  items: viewModel.dropDownItems.map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(_numberToText(item)),
                  )).toList(),
                  onChanged: (value) => setState((){
                    viewModel.onDropDownChanged(value);
                  }),
                ),
              ],
            ),
            CheckboxListTile(
              value: viewModel.checkboxChecked,
              onChanged: (value) => setState((){
                viewModel.onCheckboxChanged();
              }),
              title: Text(viewModel.checkboxChecked ? S.of(context).form_checkbox_checked : S.of(context).form_checkbox_not_checked),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RadioListTile(
                  title: Text(viewModel.radioGroupValue == 1 ? S.of(context).form_radio_1_on : S.of(context).form_radio_1_off),
                  groupValue: viewModel.radioGroupValue,
                  value: 1,
                  onChanged: (value) => setState(()=> viewModel.onRadioChanged(value)),
                ),
                RadioListTile(
                  title: Text(viewModel.radioGroupValue == 2 ? S.of(context).form_radio_2_on : S.of(context).form_radio_2_off),
                  groupValue: viewModel.radioGroupValue,
                  value: 2,
                  onChanged: (value) => setState((){
                    viewModel.onRadioChanged(value);
                  }),
                ),
              ],
            ),
            Slider(
              max: viewModel.sliderMax,
              min: viewModel.sliderMin,
              value: viewModel.sliderValue,
              onChanged: (value){
                setState(()=> viewModel.onSliderChanged(value));
              }
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Center(
                child: Text("${viewModel.sliderValue.truncate()}"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLandscape(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  labelText: S.of(context).form_text_hint
              ),
              controller: _textEditingController,
              validator: (value) => viewModel.validateTextInput(value,
                  S.of(context).form_text_required,
                  S.of(context).form_text_max_length("${viewModel.maxTextLength}")
              ),
              autovalidate: viewModel.autoValidate,
              onChanged: (value)=> setState((){
                viewModel.autoValidate = true;
              }),
            ),
            SwitchListTile(
              title: Text(viewModel.switchOn ? S.of(context).form_switch_on : S.of(context).form_switch_off),
              onChanged: (value) => setState(() => viewModel.onSwitchChanged()),
              value: viewModel.switchOn,
            ),
            CheckboxListTile(
              value: viewModel.checkboxChecked,
              onChanged: (value) => setState((){
                viewModel.onCheckboxChanged();
              }),
              title: Text(viewModel.checkboxChecked ? S.of(context).form_checkbox_checked : S.of(context).form_checkbox_not_checked),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: DropdownButton(
                value: viewModel.dropDownValue,
                items: viewModel.dropDownItems.map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(_numberToText(item)),
                )).toList(),
                onChanged: (value) => setState((){
                  viewModel.onDropDownChanged(value);
                }),
              ),
            ),
            Column(
              children: <Widget>[
                RadioListTile(
                  title: Text(viewModel.radioGroupValue == 1 ? S.of(context).form_radio_1_on : S.of(context).form_radio_1_off),
                  groupValue: viewModel.radioGroupValue,
                  value: 1,
                  onChanged: (value) => setState(()=> viewModel.onRadioChanged(value)),
                ),
                RadioListTile(
                  title: Text(viewModel.radioGroupValue == 2 ? S.of(context).form_radio_2_on : S.of(context).form_radio_2_off),
                  groupValue: viewModel.radioGroupValue,
                  value: 2,
                  onChanged: (value) => setState((){
                    viewModel.onRadioChanged(value);
                  }),
                ),
                Slider(
                    max: viewModel.sliderMax,
                    min: viewModel.sliderMin,
                    value: viewModel.sliderValue,
                    onChanged: (value){
                      setState(()=> viewModel.onSliderChanged(value));
                    }
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Center(
                    child: Text("${viewModel.sliderValue.truncate()}"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
