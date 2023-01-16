import 'package:app_reservas/bloc/productos_bloc.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 1;
  final PageController pageController = PageController(initialPage: 1);
  final ProductosBloc productosBloc = ProductosBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: productosBloc.productosContador,
          builder: (_, snapshot) => Text('Productos (${snapshot.data ?? 0})'),
        ),
        backgroundColor: Colors.teal[400],
      ),
      body: StreamBuilder(
          stream: productosBloc.getProductos,
          builder: (_, snapshot) {
            final productos = snapshot.data ?? [];

            return ListView.builder(
                itemCount: productos.length,
                itemBuilder: (_, int i) {
                  return ListTile(title: Text(productos[i]));
                });
          }),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (index) {
            currentPage = index;

            pageController.animateToPage(currentPage,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut);

            setState(() {});
          },
          backgroundColor: Colors.red,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.5),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.verified_user_outlined), label: 'User'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ]),
    );
  }
}

class CustomScreen extends StatelessWidget {
  final Color color;

  const CustomScreen({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: this.color, child: const Center(child: Text('Custom Screen')));
  }
}
