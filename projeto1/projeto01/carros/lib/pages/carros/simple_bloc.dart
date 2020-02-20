import 'dart:async';

class SimpleBloc<T> {

  final _controller = StreamController<T>();

  Stream<T> get stream => _controller.stream;

  void add(T object){
    _controller.add(object);
  }

  void addError(Object error){
    _controller.addError(error);
  }

}

class BooleanBloc extends SimpleBloc<bool>{

}