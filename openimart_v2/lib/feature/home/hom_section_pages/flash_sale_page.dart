import 'package:flutter/material.dart';

class FlashSalePage extends StatelessWidget {
  final Map<String, List<Map<String, String>>> productData = {
    "All": [
      {
        "image": "https://via.placeholder.com/150",
        "title": "High-quality Smart LED",
        "price": "৳289",
        "originalPrice": "৳660",
        "discount": "56% off",
        "freeDelivery": "true",
        "wowDeal": "true",
      },
      {
        "image": "https://via.placeholder.com/150",
        "title": "Rajkonna Brightening Lotion",
        "price": "৳255",
        "originalPrice": "৳425",
        "discount": "40% off",
        "freeDelivery": "true",
        "wowDeal": "true",
      },
    ],
    "Bata": [
      {
        "image": "https://via.placeholder.com/150",
        "title": "Bata ZONE Formal Shoes",
        "price": "৳480",
        "originalPrice": "৳1,599",
        "discount": "70% off",
        "freeDelivery": "false",
        "wowDeal": "false",
      },
    ],
    "BestSale": [
      {
        "image": "https://via.placeholder.com/150",
        "title": "MINISTER ONE Rice 1KG",
        "price": "৳96",
        "originalPrice": "৳130",
        "discount": "26% off",
        "freeDelivery": "false",
        "wowDeal": "false",
      },
    ],
    "Electronics": [
      {
        "image": "https://via.placeholder.com/150",
        "title": "High-quality Smart LED",
        "price": "৳289",
        "originalPrice": "৳660",
        "discount": "56% off",
        "freeDelivery": "true",
        "wowDeal": "true",
      },
    ],
    "Health & Beauty": [
      {
        "image": "https://via.placeholder.com/150",
        "title": "Rajkonna Brightening Lotion",
        "price": "৳255",
        "originalPrice": "৳425",
        "discount": "40% off",
        "freeDelivery": "true",
        "wowDeal": "true",
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: productData.keys.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink.shade100,
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Flash Sale",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Icon(Icons.search, color: Colors.black),
                  SizedBox(width: 16),
                  Icon(Icons.shopping_cart, color: Colors.black),
                  SizedBox(width: 16),
                  Icon(Icons.notifications, color: Colors.black),
                ],
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.local_offer, size: 15, color: Colors.black),
                    SizedBox(width: 4),
                    Text(
                      "Limited-time offer",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.local_shipping, size: 18, color: Colors.black),
                    SizedBox(width: 4),
                    Text(
                      "Extra discount",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: Container(
              color: Colors.white, // Set background color of the TabBar
              child: TabBar(
                isScrollable: true,
                indicatorColor: Colors.red,
                labelColor: Colors.red,
                unselectedLabelColor: Colors.black,
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                tabs: productData.keys.map((category) {
                  // Apply specific styles to the "Bata" tab
                  if (category == "Bata") {
                    return Tab(
                      child: Text(
                        category,
                        style: TextStyle(
                          fontSize: 28, // Larger font size for Bata
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.red,
                        ),
                      ),
                    );
                  }
                  return Tab(text: category);
                }).toList(),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: productData.keys.map((category) {
            final products = productData[category]!;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Image
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(8),
                              ),
                              child: Image.network(
                                product["image"]!,
                                width: double.infinity,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            if (product["wowDeal"] == "true")
                              Positioned(
                                top: 8,
                                left: 8,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.purple,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    "WOW Deal",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ),
                            if (product["freeDelivery"] == "true")
                              Positioned(
                                bottom: 8,
                                left: 8,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    "FREE DELIVERY",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                ),
                              ),
                          ],
                        ),

                        // Product Info
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product["title"]!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "On sale now",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product["price"]!,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                      Text(
                                        product["originalPrice"]!,
                                        style: TextStyle(
                                          fontSize: 12,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      product["discount"]!,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: FlashSalePage(),
    theme: ThemeData(primarySwatch: Colors.pink),
  ));
}
