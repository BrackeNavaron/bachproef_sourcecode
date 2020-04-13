
import 'package:bachelorproef/viewmodel/formViewModel.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

///This class defines an 'Injector Configuration'.
///This is where an [Injector] gets set up for use.
abstract class InjectorConfig {
  ///Configure the [Injector].
  ///When this function returns,
  ///we can access the [Injector] through Injector.getInjector()
  Future<void> configureInjection();
}

///This class configures the default [Injector] for production.
class ProductionConfig implements InjectorConfig {
  @override
  Future<void> configureInjection() async {
    final injector = Injector.getInjector();
    //init database(s) so we can provide them

    //configure dependencies
    injector.map<FormViewModel>((i) => FormViewModel());
  }
}

///Testing Setup:
///- Create an [InjectorConfig].
///- start the test
///- do triple A in test (Arrange Act Assert)
///- in tearDown of test -> dispose of the injector by calling dispose() on the injector
class TestConfig implements InjectorConfig {
  @override
  Future<void> configureInjection() async {
    // TODO: implement configureInjection
  }
}

class DevConfig implements InjectorConfig {
  @override
  Future<void> configureInjection() async {
    // TODO: implement configureInjection
  }
}