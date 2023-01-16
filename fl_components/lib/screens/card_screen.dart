import 'package:flutter/material.dart';
import 'package:fl_components/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Card Widget')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: const [
          CustomCardType1(),
          SizedBox(height: 20),
          CustomCardType2(
            imageUrl:
                'https://upload.wikimedia.org/wikipedia/commons/8/86/Landscape_mountain.jpg',
            name: 'Un hermoso paisaje',
          ),
          SizedBox(height: 20),
          CustomCardType2(
            imageUrl:
                'https://upload.wikimedia.org/wikipedia/commons/b/b2/Alpine_Landscape_%28250461587%29.jpeg',
          ),
          SizedBox(height: 20),
          CustomCardType2(
            imageUrl:
                'https://live.staticflickr.com/878/40291533535_8bbfa6657f_b.jpg',
            name: 'Montes',
          ),
        ],
      ),
    );
  }
}
