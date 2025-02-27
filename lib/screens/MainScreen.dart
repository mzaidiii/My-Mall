import 'package:flutter/material.dart';
import 'package:practice/model/product.dart';
import 'package:practice/screens/Add.dart';

class Mainscreen extends StatefulWidget {
  @override
  State<Mainscreen> createState() {
    return _MAinscreen();
  }
}

class _MAinscreen extends State<Mainscreen> {
  List<Product> products = [
    Product(
      id: '1',
      name: 'Backpack',
      price: 400,
      imageUrl: "https://via.placeholder.com/200",
      description: 'Durable backpack for daily use',
      category: 'Accessories',
      createdAt: DateTime.now(),
    ),
    Product(
      id: '2',
      name: 'Smart Watch',
      price: 99.99,
      imageUrl:
          "https://source.unsplash.com/200x200/?smartwatch", // Random smartwatch image
      description: 'Fitness tracker with heart rate monitor',
      category: 'Wearable',
      createdAt: DateTime.now(),
    ),
    Product(
      id: '3',
      name: 'Gaming Mouse',
      price: 39.99,
      imageUrl:
          "https://source.unsplash.com/200x200/?mouse", // Random mouse image
      description: 'Gaming mouse with RGB lighting',
      category: 'Gaming Accessories',
      createdAt: DateTime.now(),
    ),
    Product(
      id: '4',
      name: 'Laptop Backpack',
      price: 29.99,
      imageUrl: "https://source.unsplash.com/200x200/?backpack",
      description: 'Stylish and spacious laptop backpack',
      category: 'Accessories',
      createdAt: DateTime.now(),
    ),
    Product(
      id: '5',
      name: 'Bluetooth Speaker',
      price: 49.99,
      imageUrl: "https://source.unsplash.com/200x200/?speaker",
      description: 'Portable Bluetooth speaker with deep bass',
      category: 'Audio',
      createdAt: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Mall'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => AddProduct()),
                  );
                },
                icon: Icon(Icons.add_shopping_cart))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: GridView.builder(
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, childAspectRatio: 0.8),
            itemBuilder: (context, index) {
              final item = products[index];
              return InkWell(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 5,
                            spreadRadius: 2,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          item.imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          errorBuilder: (context, error, stackTrace) =>
                              Icon(Icons.image_not_supported),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      right: 10,
                      child: Column(
                        children: [
                          Text(item.name),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }
}
