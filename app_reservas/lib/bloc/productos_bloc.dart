import 'dart:async';

const PRODUCTOS = ['Micrófono', 'Parlante', 'Teclado', 'Cámara'];

class ProductosBloc {
  Stream<List<String>> get getProductos async* {
    final List<String> productos = [];

    for (String producto in PRODUCTOS) {
      await Future.delayed(const Duration(seconds: 2));

      productos.add(producto);

      yield productos;
    }
  }

  final StreamController<int> _productosContador = StreamController<int>();
  Stream<int> get productosContador => _productosContador.stream;

  ProductosBloc() {
    getProductos.listen(
        (productosList) => _productosContador.add(productosList.length));
  }

  dispose() {
    _productosContador.close();
  }
}
