import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/carro/carros_api.dart';
import 'dart:async';

class CarrosBloc {

  final _streamController = StreamController<List<Carro>>();

  Stream<List<Carro>> get stream => _streamController.stream;

  fetch(String tipo) async {
    try {
      List<Carro> carros = await CarrosApi.getCarros(tipo);
      _streamController.add(carros);
    } catch (e) {
      _streamController.addError(e);
    }
  }

}

