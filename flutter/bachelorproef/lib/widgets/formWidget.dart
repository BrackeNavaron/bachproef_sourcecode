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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).forms),
      ),
      body: MediaQuery.of(context).orientation == Orientation.portrait ? _buildPortrait(context) : _buildLandscape(context),
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
              }),//Trigger the autovalidate redraw
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
              }),//Trigger the autovalidate redraw
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    viewModel.clear();
    _textEditingController.dispose();
    super.dispose();
  }
}
