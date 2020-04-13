import 'package:bachelorproef/generated/i18n.dart';
import 'package:bachelorproef/viewmodel/FormViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class FormWidget extends StatefulWidget {

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {

  final FormViewModel viewModel = Injector.getInjector().get<FormViewModel>();

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

  }

  Widget _buildLandscape(BuildContext context){

  }
}
