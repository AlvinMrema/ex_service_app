import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ServiceSection(),
    );
  }
}

class ServiceSection extends StatelessWidget {
  const ServiceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('App'),
        ),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Column(
          children: [
            Center(
              child: Text(
                'Service',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ServiceCard(
                  item: 'Portifolio',
                  price: '\$50',
                ),
                ServiceCard(
                  item: 'Portifolio fitting osau hfo csoufh',
                  price: '\$150',
                ),
              ],
            ),
          ],
        ),
      ),
    ); // Text('Ex App');
  }
}

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    super.key,
    required this.item,
    required this.price,
  });

  final String item;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: 170,
      height: 230,
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                // padding: const EdgeInsets.all(1),
                width: 150,
                height: 164,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(12),
                // ),
                child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  imageUrl:
                      "https://medias.spotern.com/spots/w360/260/260853-1575462221.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned(
                top: 5,
                right: 5,
                child: Icon(
                  Icons.arrow_circle_right_outlined,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
            ],
          ),
          const SizedBox(height: 1),
          Text(
            item,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 15),
          ),
          Text(
            price,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
