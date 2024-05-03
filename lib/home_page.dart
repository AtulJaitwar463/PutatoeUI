
import 'package:flutter/material.dart';
import 'package:putatoe_ui/list.dart';
import 'package:putatoe_ui/string.dart';
import 'package:velocity_x/velocity_x.dart';

import 'home_buttons.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    String currentLocation = "";
    int selectedIndex = -1;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.location_on),
          onPressed: () {
            currentLocation = "Your Location"; // Update location
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification button press
              print("Notification button pressed");
            },
          ),
          TextButton.icon(
            onPressed: () {
              // Handle buy now button press
              print("Buy Now button pressed");
            },
            icon: Icon(Icons.shopping_cart),
            label: Text(""),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              children: [
                Container(
                  width: 270,
                  height: 50.0,
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Search",
                            prefixIcon: Icon(Icons.search),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.assistant),
                        onPressed: () {
                          // Handle Assistant button press
                          print("Assistant button pressed");
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                // Row(
                //   children: List.generate(3, (index) => HomeButtons()), // Assuming HomeButtons is a custom widget
                // ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: const EdgeInsets.all(12),
              color: Colors.white,
              width: 350,
              height: 170,
              child: SafeArea(
                child: Row(
                  children: [
                    Expanded(
                      child: VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        autoPlayInterval:
                            Duration(seconds: 3), // Adjust as needed
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        height: 170,
                        enlargeCenterPage: true,
                        itemCount: sliderList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Image.asset(
                              sliderList[index],
                              fit: BoxFit.fill,
                            )
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 8.0))
                                .make(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 80,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.symmetric(
                  horizontal: BorderSide.none,
                  vertical: BorderSide.none,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset.zero,
                    blurRadius: 2.0,
                    spreadRadius: 5.0,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ImageButton(
                    label: 'Recharge',
                    imagePath: icRechargeWallet,
                    onPressed: () {
                      print('Mobile Recharge tapped');
                    },
                  ),
                  ImageButton(
                    label: 'News',
                    imagePath: icNews,
                    onPressed: () {
                      print('News tapped');
                    },
                  ),
                  ImageButton(
                    label: 'Jobs',
                    imagePath: icEmployee,
                    onPressed: () {
                      print('Jobs tapped');
                    },
                  ),
                  ImageButton(
                    label: 'Bills',
                    imagePath: icElectricity,
                    onPressed: () {
                      print('Bills tapped');
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            Container(
              margin: EdgeInsets.all(10),
              height: 40,
              width: 340,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.teal.shade50, // Border color
                  width: 2, // Border width
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                   "Popular Products",
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Beverages',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Implement action for "View All" button
                        },
                        child: Text(
                          'View All',
                          style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16),
                  SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                   child:
                    Row(
                      children: [
                        _buildProductItem(
                          name: 'Frooty',
                          price: '\$2.50',
                          image: 'assets/beverages/frooti.jpeg',
                          unit: '250ml',
                          discount: '10%',
                        ),
                        SizedBox(width: 16),
                        _buildProductItem(
                          name: 'Coca Cola',
                          price: '\$1.99',
                          image: 'assets/beverages/cocacola.jpeg',
                          unit: '500ml',
                          discount: '5%',
                        ),
                        SizedBox(width: 16),
                        _buildProductItem(
                          name: 'Pepsi',
                          price: '\$1.75',
                          image: 'assets/beverages/pepsi.jpeg',
                          unit: '330ml',
                          discount: '15%',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Grocery',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Implement action for "View All" button
                        },
                        child: Text(
                          'View All',
                          style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:
                    Row(
                      children: [
                        _buildProductItem(
                          name: 'Badam',
                          price: '\$2.50',
                          image: 'assets/groceryImages/badam.png',
                          unit: '1 Kg',
                          discount: '10%',
                        ),
                        SizedBox(width: 16),
                        _buildProductItem(
                          name: 'Cashew',
                          price: '\$1.99',
                          image: 'assets/groceryImages/kaju.jpeg',
                          unit: '500ml',
                          discount: '5%',
                        ),
                        SizedBox(width: 16),
                        _buildProductItem(
                          name: 'Kismis',
                          price: '\$1.75',
                          image: 'assets/groceryImages/kismis.jpeg',
                          unit: '330ml',
                          discount: '15%',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Fruits',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Implement action for "View All" button
                        },
                        child: Text(
                          'View All',
                          style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:
                    Row(
                      children: [
                        _buildProductItem(
                          name: 'Apple',
                          price: '\$2.50',
                          image: 'assets/fruitsImage/apple.png',
                          unit: '250ml',
                          discount: '10%',
                        ),
                        SizedBox(width: 16),
                        _buildProductItem(
                          name: 'Grapes',
                          price: '\$1.99',
                          image: 'assets/fruitsImage/grapes.png',
                          unit: '500ml',
                          discount: '5%',
                        ),
                        SizedBox(width: 16),
                        _buildProductItem(
                          name: 'Bannana',
                          price: '\$1.75',
                          image: 'assets/fruitsImage/bannana.png',
                          unit: '330ml',
                          discount: '15%',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Dairy Products',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Implement action for "View All" button
                        },
                        child: Text(
                          'View All',
                          style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:
                    Row(
                      children: [
                        _buildProductItem(
                          name: 'Lassi',
                          price: '\$2.50',
                          image: 'assets/dairyImages/lassi.jpeg',
                          unit: '250ml',
                          discount: '10%',
                        ),
                        SizedBox(width: 16),
                        _buildProductItem(
                          name: 'Curd',
                          price: '\$1.99',
                          image: 'assets/dairyImages/curd.jpeg',
                          unit: '500ml',
                          discount: '5%',
                        ),
                        SizedBox(width: 16),
                        _buildProductItem(
                          name: 'Paneer',
                          price: '\$1.75',
                          image: 'assets/dairyImages/paneer.jpeg',
                          unit: '330ml',
                          discount: '15%',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Vegetables',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Implement action for "View All" button
                        },
                        child: Text(
                          'View All',
                          style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:
                    Row(
                      children: [
                        _buildProductItem(
                          name: 'Onion',
                          price: '\$2.50',
                          image: 'assets/vegetablesImages/onion.png',
                          unit: '500 gm',
                          discount: '10%',
                        ),
                        SizedBox(width: 16),
                        _buildProductItem(
                          name: 'Gobi',
                          price: '\$1.99',
                          image: 'assets/vegetablesImages/gobi.png',
                          unit: '1 kg',
                          discount: '5%',
                        ),
                        SizedBox(width: 16),
                        _buildProductItem(
                          name: 'Mattor',
                          price: '\$1.75',
                          image: 'assets/vegetablesImages/mattor.png',
                          unit: '500gm',
                          discount: '15%',
                        ),
                        SizedBox(width: 16),
                        _buildProductItem(
                          name: 'Tomato',
                          price: '\$1.75',
                          image: 'assets/vegetablesImages/tamatar.png',
                          unit: '500gm',
                          discount: '15%',
                        ),
                        SizedBox(width: 16),
                        _buildProductItem(
                          name: 'Broccoli',
                          price: '\$1.75',
                          image: 'assets/vegetablesImages/broccoli.png',
                          unit: '500gm',
                          discount: '15%',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),




          ],
        ),
      ),
    );
  }


  Widget _buildProductItem({
    required String name,
    required String price,
    required String image,
    required String unit,
    required String discount,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16),
            Container( // Use Container with fixed width instead of Expanded
              width: 200, // Adjust the width as needed
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Price: $price',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Unit: $unit',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Discount: $discount off',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {
                      // Implement share functionality
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider(), // Add a divider between each product item
      ],
    );
  }

}

class ImageButton extends StatelessWidget {
  final String label;
  final String imagePath;
  final VoidCallback onPressed;

  const ImageButton({
    required this.label,
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 26),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: Colors.black, // Text color when button is not selected
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
