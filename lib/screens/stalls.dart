import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Meal {
  final String name;
  final double price;

  Meal({required this.name, required this.price});
}

class Stall {
  final int id;
  final String name;
  final String priceRange;
  final String description;
  final String location;
  final String image;
  final List<Meal> meals;

  Stall({
    required this.id,
    required this.name,
    required this.priceRange,
    required this.description,
    required this.location,
    required this.image,
    required this.meals,
  });
}

class StallsPage extends StatefulWidget {
  const StallsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StallsPageState createState() => _StallsPageState();
}

class _StallsPageState extends State<StallsPage> {
  int? selectedStallIndex;
  List<String> selectedLocations = [];
  Map<Meal, bool> cart = {};
  final List<Stall> stalls = [
    Stall(
        id: 1,
        name: 'IloveMilktea Store',
        priceRange: '₱20 - ₱60',
        description:
            'A delightful stop for milktea enthusiasts and snack lovers alike, IloveMilktea Store offers a variety of savory snacks and refreshing drinks. Enjoy their classic siopao and crispy lumpiang shanghai paired with a perfectly brewed wintermelon or taro milktea.',
        location: '2nd Floor',
        image: 'assets/stalls/lovemilktea.jpg',
        meals: [
          Meal(name: 'Siopao', price: 20.0),
          Meal(name: 'Lumpiang Shanghai', price: 30.0),
          Meal(name: 'Wintermelon Milktea', price: 50.0),
          Meal(name: 'Taro Milktea', price: 50.0),
        ]),
    Stall(
        id: 2,
        name: 'Cafe Pink Wall Shop',
        priceRange: '₱20 - ₱55',
        description:
            'This cozy café provides a warm atmosphere with its pink-themed decor. The menu features comforting snacks like toast with butter, ensaymada, and delicious cookies, alongside rich brewed and iced coffee options to fuel your day.',
        location: '2nd Floor',
        image: 'assets/stalls/pinkwall.jpg',
        meals: [
          Meal(name: 'Toast with Butter', price: 20.0),
          Meal(name: 'Ensaymada', price: 30.0),
          Meal(name: 'Cookies', price: 30.0),
          Meal(name: 'Brewed Coffee', price: 40.0),
          Meal(name: 'Iced Coffee', price: 50.0),
        ]),
    Stall(
        id: 3,
        name: 'Generic Green Walled Store',
        priceRange: '₱20 - ₱50',
        description:
            'Known for its casual vibe, this store serves up tasty bites that are perfect for a quick snack. Indulge in cheese sticks and nachos, or enjoy a classic hotdog on a stick while sipping on a refreshing mango shake or halo-halo.',
        location: '2nd Floor',
        image: 'assets/stalls/greenwall.jpg',
        meals: [
          Meal(name: 'Cheese Sticks', price: 20.0),
          Meal(name: 'Nachos', price: 30.0),
          Meal(name: 'Hotdog on a Stick', price: 30.0),
        ]),
    Stall(
        id: 4,
        name: "Zen's Cafe",
        priceRange: '₱20 - ₱55',
        description:
            "Zen's Cafe is all about comfort food and quality beverages. With items like the ube cheese pandesal and hearty tuna sandwich, you can satisfy your cravings. Their coffee selection is a must-try for anyone needing a caffeine fix.",
        location: '2nd Floor',
        image: 'assets/stalls/zencafe.jpg',
        meals: [
          Meal(name: 'Ube Cheese Pandesal', price: 20.0),
          Meal(name: 'Tuna Sandwich', price: 30.0),
          Meal(name: 'Brewed Coffee', price: 40.0),
          Meal(name: 'Iced Coffee', price: 50.0),
        ]),
    Stall(
        id: 5,
        name: 'Chickbrew',
        priceRange: '₱30 - ₱55',
        description:
            ' Specializing in chicken dishes, Chickbrew is perfect for fried chicken fans. From chicken fillet sandwiches to crunchy wings and nuggets, there’s something for everyone. Pair your meal with their flavorful iced coffee for a complete experience.',
        location: '2nd Floor',
        image: 'assets/stalls/chickbrew.jpg',
        meals: [
          Meal(name: 'Chicken Fillet Sandwich', price: 30.0),
          Meal(name: 'Chicken Wings', price: 40.0),
          Meal(name: 'Chicken Nuggets', price: 40.0),
          Meal(name: 'Iced Coffee', price: 50.0),
        ]),
    Stall(
        id: 6,
        name: 'Mushin Japanese Cafe',
        priceRange: '₱35 - ₱70',
        description:
            'For those craving Japanese flavors, Mushin Japanese Cafe serves an array of authentic dishes, including takoyaki and chicken ramen. Their gyoza and tempura provide a delightful taste of Japan, complemented by refreshing iced coffee or a matcha latte.',
        location: '2nd Floor',
        image: 'assets/stalls/mushin.jpg',
        meals: [
          Meal(name: 'Takoyaki', price: 35.0),
          Meal(name: 'Chicken Ramen', price: 50.0),
          Meal(name: 'Gyoza', price: 50.0),
          Meal(name: 'Tempura', price: 60.0),
          Meal(name: 'Iced Coffee', price: 60.0),
          Meal(name: 'Matcha Latte', price: 70.0),
        ]),
    Stall(
        id: 7,
        name: 'Green Kiosk',
        priceRange: '₱15 - ₱50',
        description:
            'A vibrant stop for value lovers, Green Kiosk offers enticing buy-one-take-one deals on burgers, hotdogs, and nachos. Enjoy hearty meals like chicken BBQ and pancit canton, perfect for sharing or satisfying your hunger solo.',
        location: '1st Floor',
        image: 'assets/stalls/greenkiosk.jpg',
        meals: [
          Meal(name: 'Burger', price: 15.0),
          Meal(name: 'Hotdog', price: 20.0),
          Meal(name: 'Nachos', price: 20.0),
          Meal(name: 'Chicken BBQ', price: 30.0),
          Meal(name: 'Pancit Canton', price: 40.0),
        ]),
    Stall(
        id: 8,
        name: 'Dinette, etc',
        priceRange: '₱25 - ₱50',
        description:
            'Dinette, etc provides a casual dining experience with its selection of burgers and snacks. Their burger with fries is a favorite, while the chicken nuggets combo offers a satisfying option for those craving comfort food.',
        location: '1st Floor',
        image: 'assets/stalls/dinette.jpg',
        meals: [
          Meal(name: 'Burger with Fries', price: 25.0),
          Meal(name: 'Chicken Nuggets Combo', price: 30.0),
        ]),
    Stall(
        id: 9,
        name: 'Kiosk 1',
        priceRange: '₱20 - ₱55',
        description:
            'This kiosk specializes in delicious waffles and French toast. Whether you prefer plain or hotdog waffles, Kiosk 1 has a sweet or savory option for everyone. Pair your treat with a hot chocolate or iced coffee for a delightful snack break.',
        location: '1st Floor',
        image: 'assets/stalls/kiosk1.jpg',
        meals: [
          Meal(name: 'Plain Waffle', price: 20.0),
          Meal(name: 'Hotdog Waffle', price: 30.0),
          Meal(name: 'French Toast', price: 30.0),
          Meal(name: 'Hot Chocolate', price: 40.0),
          Meal(name: 'Iced Coffee', price: 50.0),
        ]),
    Stall(
        id: 10,
        name: 'Kiosk 2',
        priceRange: '₱40 - ₱55',
        description:
            'Kiosk 2 serves traditional Filipino dishes, including pork adobo and chicken curry. Each meal is prepared with authentic flavors, providing a taste of home in every bite. Perfect for those seeking hearty, familiar meals.',
        location: '1st Floor',
        image: 'assets/stalls/kiosk2.jpg',
        meals: [
          Meal(name: 'Pork Adobo', price: 40.0),
          Meal(name: 'Chicken Curry', price: 50.0),
        ]),
    Stall(
        id: 11,
        name: 'Kiosk 3',
        priceRange: '₱45 - ₱55',
        description:
            'Known for its comfort meals, Kiosk 3 offers fried chicken, lumpia, and classic Filipino favorites like pork sinigang and chicken inasal. Each dish promises to warm your heart and satisfy your taste buds.',
        location: '1st Floor',
        image: 'assets/stalls/kiosk3.jpg',
        meals: [
          Meal(name: 'Fried Chicken', price: 45.0),
          Meal(name: 'Lumpia', price: 45.0),
          Meal(name: 'Pork Sinigang', price: 50.0),
          Meal(name: 'Chicken Inasal', price: 50.0),
        ]),
    Stall(
        id: 12,
        name: 'Kiosk 4',
        priceRange: '₱40 - ₱50',
        description:
            'Kiosk 4 presents a selection of beloved Filipino comfort food, including pork sisig and chicken adobo. With delicious home-cooked flavors, this kiosk is a must-visit for fans of traditional meals.',
        location: '1st Floor',
        image: 'assets/stalls/kiosk4.jpg',
        meals: [
          Meal(name: 'Pork Sisig', price: 40.0),
          Meal(name: 'Chicken Adobo', price: 50.0),
        ]),
    Stall(
        id: 13,
        name: 'Kiosk 5',
        priceRange: '₱40 - ₱55',
        description:
            "Offering a customizable experience, Kiosk 5 allows you to pick your carenderia meal, which includes rice, one meat, and one veggie. This flexibility, along with favorites like chicken afritada, ensures there's something for everyone.",
        location: '1st Floor',
        image: 'assets/stalls/kiosk5.jpg',
        meals: [
          Meal(name: 'Carenderia Meal', price: 40.0),
          Meal(name: 'Chicken Afritada', price: 50.0),
        ]),
    Stall(
        id: 14,
        name: 'Kiosk 6, 7, 8',
        priceRange: '₱60 - ₱75',
        description:
            'For those looking for a more filling meal, these kiosks provide hearty options like pork BBQ and beef caldereta. Each dish is generously portioned, making it an ideal choice for a substantial lunch or dinner.',
        location: '1st Floor',
        image: 'assets/stalls/kiosk678.jpg',
        meals: [
          Meal(name: 'Pork BBQ', price: 60.0),
          Meal(name: 'Beef Caldereta', price: 75.0),
        ]),
    Stall(
        id: 15,
        name: 'Kiosk 9',
        priceRange: '₱30 - ₱35',
        description:
            'Another great waffle destination, Kiosk 9 serves up a variety of waffle options with delicious toppings like cheese and yema. Perfect for a light snack or a sweet treat to brighten your day.',
        location: '1st Floor',
        image: 'assets/stalls/kiosk9.jpg',
        meals: [
          Meal(name: 'Cheese Waffle', price: 30.0),
          Meal(name: 'Yema Waffle', price: 35.0),
        ]),
    Stall(
        id: 16,
        name: 'Kiosk 10',
        priceRange: '₱20 - ₱55',
        description:
            'Kiosk 10 is a go-to spot for classic Filipino street food. Enjoy favorites like isaw, betamax, and kikiam, or try their refreshing buko juice and melon shake for a satisfying snack break.',
        location: '1st Floor',
        image: 'assets/stalls/kiosk10.jpg',
        meals: [
          Meal(name: 'Isaw', price: 20.0),
          Meal(name: 'Betamax', price: 30.0),
          Meal(name: 'Kikiam', price: 30.0),
          Meal(name: 'Buko Juice', price: 40.0),
          Meal(name: 'Melon Shake', price: 50.0),
        ]),
    Stall(
        id: 17,
        name: 'Kiosk 11',
        priceRange: '₱20 - ₱55',
        description:
            'Kiosk 11 offers a variety of Filipino snacks and drinks, including fish balls, kwek-kwek, and refreshing gulaman. Their selection of street food favorites is perfect for those looking to enjoy classic flavors on the go.',
        location: '1st Floor',
        image: 'assets/stalls/kiosk11.jpg',
        meals: [
          Meal(name: 'Fish Balls', price: 20.0),
          Meal(name: 'Kwek-Kwek', price: 30.0),
          Meal(name: 'Gulaman', price: 30.0),
          Meal(name: 'Buko Juice', price: 40.0),
          Meal(name: 'Melon Shake', price: 50.0),
        ]),
    Stall(
        id: 18,
        name: 'Kiosk 12',
        priceRange: '₱20 - ₱60',
        description:
            'This kiosk is a haven for snack lovers, offering a selection of sweet treats like puto and kutsinta. For a refreshing drink, try their ube matcha lemonade or bubble teas, perfect for cooling off on warm days.',
        location: '1st Floor',
        image: 'assets/stalls/kiosk12.jpg',
        meals: [
          Meal(name: 'Puto', price: 20.0),
          Meal(name: 'Kutsinta', price: 30.0),
          Meal(name: 'Ube Matcha Lemonade', price: 40.0),
          Meal(name: 'Bubble Tea', price: 50.0),
        ]),
  ];

  void handleSelectStall(int index) {
    setState(() {
      selectedStallIndex = index;
    });
  }

  void closeModal() {
    setState(() {
      selectedStallIndex = null;
    });
  }

  double calculateTotalPrice() {
    return cart.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key.price)
        .fold(0, (previousValue, element) => previousValue + element);
  }

  // Removed duplicate method definition

  void navigateStalls(String direction) {
    final filteredStalls = stalls.where((stall) {
      return selectedLocations.isEmpty ||
          selectedLocations.contains(stall.location);
    }).toList();

    if (filteredStalls.isEmpty) return;

    int newIndex = filteredStalls.indexOf(stalls[selectedStallIndex!]);

    if (direction == 'next') {
      newIndex = (newIndex + 1) % filteredStalls.length;
    } else {
      newIndex = (newIndex - 1 + filteredStalls.length) % filteredStalls.length;
    }

    setState(() {
      selectedStallIndex = stalls.indexOf(filteredStalls[newIndex]);
    });
  }

  void handleLocationChange(String location) {
    setState(() {
      if (selectedLocations.contains(location)) {
        selectedLocations.remove(location);
      } else {
        selectedLocations.add(location);
      }
    });
  }

  void handleSelectMeal(Meal meal, bool selected) {
    setState(() {
      cart[meal] = selected;
    });
  }

  void showMealsModal(BuildContext context, Stall stall) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            width: MediaQuery.of(context).size.width * 0.5, // Responsive width
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min, // Shrinks to content size
                  children: [
                    // Header
                    Text(
                      stall.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),

                    // Meals List
                    Flexible(
                      child: ListView(
                        shrinkWrap: true,
                        children: stall.meals.map((meal) {
                          return CheckboxListTile(
                            title: Text(
                              meal.name,
                              style: const TextStyle(fontSize: 16),
                            ),
                            subtitle: Text(
                              '₱${meal.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.green,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            value: cart[meal] ?? false,
                            onChanged: (selected) {
                              setState(() {
                                cart[meal] = selected!;
                              });
                              handleSelectMeal(meal, selected!);
                            },
                          );
                        }).toList(),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Add to Cart Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context); // Close the dialog
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              content: const Text(
                                'Items added to cart!',
                                style: TextStyle(fontSize: 16),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'OK',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredStalls = stalls.where((stall) {
      return selectedLocations.isEmpty ||
          selectedLocations.contains(stall.location);
    }).toList();

    // double containerWidth = MediaQuery.of(context).size.width;
    // double containerWidth = 200;


    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[850],
        elevation: 8,
        title: LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/coop.jpg'),
                      radius: 20,
                    ),
                    SizedBox(width: 15),
                    Text(
                      'WVSU Canteen',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                // Navigation Buttons Section
                constraints.maxWidth > 600
                    ? Row(
                        children: [
                          _buildNavButton(context, 'Home', false),
                          _buildNavButton(context, 'Stalls', true),
                          _buildNavButton(context, 'About Us', false),
                          _buildNavButton(context, 'Contact Us', false),
                        ],
                      )
                    : IconButton(
                        icon: const Icon(Icons.menu, color: Colors.white),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    title: const Text('Home'),
                                    onTap: () => Navigator.pushNamed(context, '/'),
                                  ),
                                  ListTile(
                                    title: const Text('Stalls'),
                                    onTap: () => Navigator.pushNamed(context, '/stalls'),
                                  ),
                                  ListTile(
                                    title: const Text('About Us'),
                                    onTap: () => Navigator.pushNamed(context, '/about_us'),
                                  ),
                                  ListTile(
                                    title: const Text('Contact Us'),
                                    onTap: () => Navigator.pushNamed(context, '/contact_us'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
              ],
            );
          },
        ),
      ),



      body: SingleChildScrollView(
        // Wrap the whole body with SingleChildScrollView
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 10.0,
                children: ['1st Floor', 'Outside', '2nd Floor'].map((location) {
                  return FilterChip(
                    label: Text(location),
                    selected: selectedLocations.contains(location),
                    onSelected: (_) => handleLocationChange(location),
                  );
                }).toList(),
              ),
            ),
            // Stall grid with consistent item size
            filteredStalls.isNotEmpty
            ? LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = (constraints.maxWidth * 0.8 / 200).floor();
                if (crossAxisCount < 2) crossAxisCount = 2; 
                return Center(
                child: SizedBox(
                  width: constraints.maxWidth * 0.8,
                  child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredStalls.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 1,  
                  ),
                  itemBuilder: (context, index) {
                    final stall = filteredStalls[index];
                    return GestureDetector(
                    onTap: () => showMealsModal(context, stall),
                    child: Card(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                        width: double.infinity,
                        height: 110,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                          image: AssetImage(stall.image),
                          fit: BoxFit.cover,
                          ),
                        ),
                        ),
                        Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          stall.name,
                          style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1, // Limit to 1 line
                          overflow: TextOverflow.ellipsis, 
                        ),
                        ),
                        Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          stall.priceRange,
                          style: const TextStyle(
                          color: Colors.green,
                          ),
                        ),
                        ),
                      ],
                      ),
                    ),
                    );
                  },
                  ),
                ),
                );
              },
              )
            : const Center(child: Text('No stalls available')),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showCart,
        backgroundColor: Colors.black.withOpacity(0.9),
        child: const Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
      ),
    );
  }

  Future<void> saveOrderToFirestore(String userId, int orderNumber,
      double totalPrice, Map<Stall, List<Meal>> groupedItems) async {
    final firestore = FirebaseFirestore.instance;
    final orderData = {
      'orderNumber': orderNumber,
      'totalPrice': totalPrice,
      'timestamp': FieldValue.serverTimestamp(),
      'items': groupedItems.entries.map((entry) {
        return {
          'stall': entry.key.name,
          'meals': entry.value
              .map((meal) => {
                    'name': meal.name,
                    'price': meal.price,
                  })
              .toList(),
        };
      }).toList(),
    };

    try {
      await firestore
          .collection('users')
          .doc(userId)
          .collection('orders')
          .add(orderData);
      print('Order saved successfully.');
    } catch (e) {
      print('Error saving order: $e');
    }
  }

  void showOrderConfirmation(
    BuildContext context,
    int orderNumber,
    double totalPrice,
    List<Meal> meals, // List of meals
  ) {
    // Group meals by stall
    final groupedMeals = groupItemsByStall();

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      const Text(
                        'Order Confirmation',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Order #: $orderNumber',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 1, height: 24),
                Column(
                  children: groupedMeals.entries.map((entry) {
                    final stall = entry.key;
                    final stallMeals = entry.value;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            stall.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal[700],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Column(
                            children: stallMeals.map((meal) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      meal.name,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      '₱${meal.price.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                const Divider(thickness: 1, height: 24),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Amount:',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(''),
                  ],
                ),
                Text(
                  '₱${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                const Divider(thickness: 1, height: 24),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Please screenshot this receipt and show it at the kiosk or stall to complete your order.',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Done',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Map<Stall, List<Meal>> groupItemsByStall() {
    final Map<Stall, List<Meal>> groupedItems = {};
    for (var entry in cart.entries.where((entry) => entry.value)) {
      final meal = entry.key;
      final stall = stalls.firstWhere((stall) => stall.meals.contains(meal));
      if (groupedItems.containsKey(stall)) {
        groupedItems[stall]!.add(meal);
      } else {
        groupedItems[stall] = [meal];
      }
    }
    return groupedItems;
  }

  void showCart() {
    showDialog(
      context: context,
      builder: (context) {
        final groupedItems = groupItemsByStall();
        final totalPrice = calculateTotalPrice();
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            height: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Shopping Cart',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Column(
                  children: groupedItems.entries.map((entry) {
                    final stall = entry.key;
                    final meals = entry.value;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            stalls.firstWhere((s) => s.id == stall.id).name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal[700],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Column(
                            children: meals.map((meal) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  title: Text(
                                    meal.name,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  trailing: Text(
                                    '₱${meal.price.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.teal,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                const Divider(),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Total Price Display
                    Text(
                      'Total: ₱${totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),

                    // Submit Order Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () async {
                        final orderNumber =
                            DateTime.now().millisecondsSinceEpoch;
                        final user = FirebaseAuth.instance.currentUser;

                        if (user != null) {
                          final userId = user.uid;
                          await saveOrderToFirestore(
                              userId, orderNumber, totalPrice, groupedItems);
                          setState(() {
                            cart.clear();
                          });
                          Navigator.pop(context);
                          showOrderConfirmation(context, orderNumber,
                              totalPrice, cart.keys.toList());
                        } else {
                          // Handle unauthenticated users
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('Please log in to submit your order.'),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        'Submit Order',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavButton(BuildContext context, String label, bool isActive) {
    return TextButton(
      onPressed: () {
        switch (label) {
          case 'Home':
            Navigator.pushNamed(context, '/');
            break;
          case 'Stalls':
            Navigator.pushNamed(context, '/stalls');
            break;
          case 'About Us':
            Navigator.pushNamed(context, '/about_us');
            break;
          case 'Contact Us':
            Navigator.pushNamed(context, '/contact_us');
            break;
        }
      },
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.grey[400],
          fontSize: 16,
        ),
      ),
    );
  }
}
