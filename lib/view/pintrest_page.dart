import 'package:aifer_project/view/view_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controller/controller.dart';
import '../model/product.dart';

class ViewPage extends StatefulWidget{
  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  final ButtonController controller = Get.put(ButtonController());

  final List<Product> products = [
    Product(name: 'Apple', imageUrl: 'https://via.placeholder.com/150/FF0000/FFFFFF?text=Apple'),
    Product(name: 'Banana', imageUrl: 'https://via.placeholder.com/150/FFFF00/FFFFFF?text=Banana'),
    Product(name: 'Orange', imageUrl: 'https://via.placeholder.com/150/FFA500/FFFFFF?text=Orange'),
    Product(name: 'Mango', imageUrl: 'https://via.placeholder.com/150/FFD700/FFFFFF?text=Mango'),
    Product(name: 'Grapes', imageUrl: 'https://via.placeholder.com/150/800080/FFFFFF?text=Grapes'),
    Product(name: 'Kiwi', imageUrl: 'https://via.placeholder.com/150/ff09ff/FFFFFF?text=Kiwi'),
    Product(name: 'Grapes', imageUrl: 'https://via.placeholder.com/150/800080/FFFFFF?text=Grapes'),
    Product(name: 'Mango', imageUrl: 'https://via.placeholder.com/150/FFD700/FFFFFF?text=Mango'),
    Product(name: 'Apple', imageUrl: 'https://via.placeholder.com/150/FF0000/FFFFFF?text=Apple'),
    Product(name: 'Banana', imageUrl: 'https://via.placeholder.com/150/FFFF00/FFFFFF?text=Banana'),
    Product(name: 'Orange', imageUrl: 'https://via.placeholder.com/150/FFA500/FFFFFF?text=Orange'),
    Product(name: 'Mango', imageUrl: 'https://via.placeholder.com/150/FFD700/FFFFFF?text=Mango'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0), child: AppBar(
        backgroundColor: Color(0xff000000),
        leading: IconButton(icon: Icon(Icons.keyboard_arrow_left,color: Colors.white,),onPressed: (){},),
        actions: [
          Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.white,width: 2),shape: BoxShape.circle),
              child: CircleAvatar(
                maxRadius: 18,
                backgroundImage: NetworkImage('https://picsum.photos/250?image=1'),

              )),
          SizedBox(width: 10,),


          ElevatedButton(
            child: Text('Follow'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              // side: BorderSide(color: Colors.yellow, width: 5),
              textStyle: const TextStyle(
                  color: Colors.white, fontSize: 18,fontWeight: FontWeight.w400 ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(80))),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  ProductGridPage()),
              );
              /// ProductGridPage();
            },
          ),
        ],

      ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),

        ),
        child: Column(
          children: [
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     // Row of buttons
            //     // Row(
            //     //   mainAxisAlignment: MainAxisAlignment.center,
            //     //   children: [
            //     //     Obx(() => ElevatedButton(
            //     //       onPressed: () => controller.onButtonTapped(0),
            //     //       style: ButtonStyle(
            //     //         backgroundColor: MaterialStateProperty.all(
            //     //           controller.buttonStates[0] ? Colors.black : Colors.white,
            //     //         ),
            //     //         foregroundColor: MaterialStateProperty.all(
            //     //           controller.buttonStates[0] ? Colors.white : Colors.black,
            //     //         ),
            //     //       ),
            //     //       child: Text('Button 1'),
            //     //     )),
            //     //     SizedBox(width: 10),
            //     //     Obx(() => ElevatedButton(
            //     //       onPressed: () => controller.onButtonTapped(1),
            //     //       style: ButtonStyle(
            //     //         backgroundColor: MaterialStateProperty.all(
            //     //           controller.buttonStates[1] ? Colors.black : Colors.white,
            //     //         ),
            //     //         foregroundColor: MaterialStateProperty.all(
            //     //           controller.buttonStates[1] ? Colors.white : Colors.black,
            //     //         ),
            //     //       ),
            //     //       child: Text('Button 2'),
            //     //     )),
            //     //     SizedBox(width: 10),
            //     //     Obx(() => ElevatedButton(
            //     //       onPressed: () => controller.onButtonTapped(2),
            //     //       style: ButtonStyle(
            //     //         backgroundColor: MaterialStateProperty.all(
            //     //           controller.buttonStates[2] ? Colors.black : Colors.white,
            //     //         ),
            //     //         foregroundColor: MaterialStateProperty.all(
            //     //           controller.buttonStates[2] ? Colors.white : Colors.black,
            //     //         ),
            //     //       ),
            //     //       child: Text('Button 3'),
            //     //     )),
            //     //   ],
            //     // ),
            //     SizedBox(height: 30),
            //     // Display content based on selected index
            //     Obx(() {
            //       List<String> content = [
            //         "This is the content for Button 1.",
            //         "This is the content for Button 2.",
            //         "This is the content for Button 3."
            //       ];
            //       return Container(
            //         padding: EdgeInsets.all(20),
            //         color: Colors.grey[200],
            //         child: Text(
            //           content[controller.selectedIndex.value],
            //           style: TextStyle(fontSize: 18),
            //         ),
            //       );
            //     }),
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text("All Products",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),)),
            ),
            Expanded(child: Container(
              height: 400,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // number of columns
                  crossAxisSpacing: 10.0, // space between columns
                  mainAxisSpacing: 10.0, // space between rows
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];

                  // Ensure that imageUrl is not null or empty
                  if (product.imageUrl.isEmpty) {
                    return Center(child: Text('No Image'));
                  }

                  return Card(
                    elevation: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image widget with a fallback in case of null URL
                        Image.network(
                          product.imageUrl,
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.expectedTotalBytes! > 0
                                    ? loadingProgress.expectedTotalBytes! > 0
                                    ? loadingProgress.cumulativeBytesLoaded /
                                    (loadingProgress.expectedTotalBytes ?? 1)
                                    : null
                                    : null
                                    : null,
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.error);
                          },
                        ),
                        SizedBox(height: 10),
                        Text(
                          product.name,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
              ),


            )),

          ],
        ),
      ),
      floatingActionButton:Container(
        margin: EdgeInsets.only(left: 100,right: 75,bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey),
          color: Colors.white54,

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.abc),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.notifications),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.ac_unit),
            )

          ],
        ),
      ) ,
    );
  }
}