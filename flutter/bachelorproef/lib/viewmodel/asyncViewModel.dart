
import 'dart:async';

import 'package:rxdart/rxdart.dart';

class AsyncViewModel {

  final StreamController _controller = BehaviorSubject<String>();
  Stream<String> get stream => _controller.stream;

  Future<String> doAsyncOperation() async {
    return Future.value("someValue");
  }

  Future<String> doAsyncOperationWithError() async {
    return Future.error("someError");
  }

  void awaitSomeFuture() async {
    final value = await doAsyncOperation();
  }

  void awaitSomeFutureCatchError() async {
    final value = await doAsyncOperationWithError().catchError((err) {
      //catch error
    });
  }

  void awaitSomeFutureWithThen() async {
    return await doAsyncOperation().then((value){
      //use value
    }, onError: (err){
      //do something with err
    });
  }

  void emitStreamValue(String value){
    _controller.add(value);
  }

  //error can be anything, from a String to an Exception.
  void emitStreamError(Object error){
    _controller.addError(error);
  }

  void dispose(){
    _controller.close();
  }

  void listenToStream(){
    stream.listen((data){
      //do something with new data
    },onError: (err){
      //do something with error
    });
  }
}