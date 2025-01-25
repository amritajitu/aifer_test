// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
//
// // Controller for GetX state management
// class ButtonController extends GetxController {
//   // Index of the selected button
//   var selectedIndex = 0.obs;
//   // Track active button states
//   var buttonStates = [false, false, false].obs;
//
//   void onButtonTapped(int index) {
//     // Reset all buttons to inactive
//     buttonStates.value = [false, false, false];
//     // Set the clicked button to active
//     buttonStates[index] = true;
//     selectedIndex.value = index; // Update the selected content index
//   }
// }
//
//
//
// class HomePage extends StatelessWidget {
//   // Initialize the controller
//   final ButtonController controller = Get.put(ButtonController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Button Page Navigation")),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Row of buttons
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Obx(() => ElevatedButton(
//                 onPressed: () => controller.onButtonTapped(0),
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(
//                     controller.buttonStates[0] ? Colors.black : Colors.white,
//                   ),
//                   foregroundColor: MaterialStateProperty.all(
//                     controller.buttonStates[0] ? Colors.white : Colors.black,
//                   ),
//                 ),
//                 child: Text('Button 1'),
//               )),
//               SizedBox(width: 10),
//               Obx(() => ElevatedButton(
//                 onPressed: () => controller.onButtonTapped(1),
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(
//                     controller.buttonStates[1] ? Colors.black : Colors.white,
//                   ),
//                   foregroundColor: MaterialStateProperty.all(
//                     controller.buttonStates[1] ? Colors.white : Colors.black,
//                   ),
//                 ),
//                 child: Text('Button 2'),
//               )),
//               SizedBox(width: 10),
//               Obx(() => ElevatedButton(
//                 onPressed: () => controller.onButtonTapped(2),
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(
//                     controller.buttonStates[2] ? Colors.black : Colors.white,
//                   ),
//                   foregroundColor: MaterialStateProperty.all(
//                     controller.buttonStates[2] ? Colors.white : Colors.black,
//                   ),
//                 ),
//                 child: Text('Button 3'),
//               )),
//             ],
//           ),
//           SizedBox(height: 30),
//           // Display content based on selected index
//           Obx(() {
//             List<String> content = [
//               "This is the content for Button 1.",
//               "This is the content for Button 2.",
//               "This is the content for Button 3."
//             ];
//             return Container(
//               padding: EdgeInsets.all(20),
//               color: Colors.grey[200],
//               child: Text(
//                 content[controller.selectedIndex.value],
//                 style: TextStyle(fontSize: 18),
//               ),
//             );
//           }),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pinterest Shop UI',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ShopPage(),
    );
  }
}

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  int _selectedIndex = 0;

  final List<Map<String, String>> _products = List.generate(10, (index) {
    return {
      "image": "https://source.unsplash.com/random/800x800?product$index",
      "name": "Product $index",
      "price": "\$${(index + 1) * 10}.00"
    };
  });

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pinterest Shop UI"),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of items per row
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75, // Adjust to fit product aspect ratio
        ),
        itemCount: _products.length,
        itemBuilder: (context, index) {
          return ProductCard(
            imageUrl: _products[index]["image"]!,
            name: _products[index]["name"]!,
            price: _products[index]["price"]!,
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;

  const ProductCard({
    required this.imageUrl,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(price, style: TextStyle(fontSize: 16, color: Colors.green)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle Add to Cart
              },
              child: Text("Add to Cart"),
            ),
          ),
        ],
      ),
    );
  }
}
