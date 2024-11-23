import 'package:flutter/material.dart';

class Stall {
  final int id;
  final String name;
  final String priceRange;
  final String description;
  final String location;
  final String image;

  Stall({
    required this.id,
    required this.name,
    required this.priceRange,
    required this.description,
    required this.location,
    required this.image,
  });
}

class StallsPage extends StatefulWidget {
  @override
  _StallsPageState createState() => _StallsPageState();
}

class _StallsPageState extends State<StallsPage> {
  int? selectedStallIndex;
  List<String> selectedLocations = [];
  final List<Stall> stalls = [
    Stall(
      id: 1,
      name: 'IloveMilktea Store',
      priceRange: '₱20 - ₱60',
      description:
          'A delightful stop for milktea enthusiasts and snack lovers alike, IloveMilktea Store offers a variety of savory snacks and refreshing drinks. Enjoy their classic siopao and crispy lumpiang shanghai paired with a perfectly brewed wintermelon or taro milktea.',
      location: '2nd Floor',
      image: 'assets/stalls/lovemilktea.jpg',
    ),
    Stall(
      id: 2,
      name: 'Cafe Pink Wall Shop',
      priceRange: '₱20 - ₱55',
      description:
          'This cozy café provides a warm atmosphere with its pink-themed decor. The menu features comforting snacks like toast with butter, ensaymada, and delicious cookies, alongside rich brewed and iced coffee options to fuel your day.',
      location: '2nd Floor',
      image: 'assets/stalls/pinkwall.jpg',
    ),
    Stall(
      id: 3,
      name: 'Generic Green Walled Store',
      priceRange: '₱20 - ₱50',
      description:
          'Known for its casual vibe, this store serves up tasty bites that are perfect for a quick snack. Indulge in cheese sticks and nachos, or enjoy a classic hotdog on a stick while sipping on a refreshing mango shake or halo-halo.',
      location: '2nd Floor',
      image: 'assets/stalls/greenwall.jpg',
    ),
    Stall(
      id: 4,
      name: "Zen's Cafe",
      priceRange: '₱20 - ₱55',
      description:
          "Zen's Cafe is all about comfort food and quality beverages. With items like the ube cheese pandesal and hearty tuna sandwich, you can satisfy your cravings. Their coffee selection is a must-try for anyone needing a caffeine fix.",
      location: '2nd Floor',
      image: 'assets/stalls/zencafe.jpg',
    ),
    Stall(
      id: 5,
      name: 'Chickbrew',
      priceRange: '₱30 - ₱55',
      description:
          ' Specializing in chicken dishes, Chickbrew is perfect for fried chicken fans. From chicken fillet sandwiches to crunchy wings and nuggets, there’s something for everyone. Pair your meal with their flavorful iced coffee for a complete experience.',
      location: '2nd Floor',
      image: 'assets/stalls/chickbrew.jpg',
    ),
    Stall(
      id: 6,
      name: 'Mushin Japanese Cafe',
      priceRange: '₱35 - ₱70',
      description:
          'For those craving Japanese flavors, Mushin Japanese Cafe serves an array of authentic dishes, including takoyaki and chicken ramen. Their gyoza and tempura provide a delightful taste of Japan, complemented by refreshing iced coffee or a matcha latte.',
      location: '2nd Floor',
      image: 'assets/stalls/mushin.jpg',
    ),
    Stall(
      id: 7,
      name: 'Green Kiosk',
      priceRange: '₱15 - ₱50',
      description:
          'A vibrant stop for value lovers, Green Kiosk offers enticing buy-one-take-one deals on burgers, hotdogs, and nachos. Enjoy hearty meals like chicken BBQ and pancit canton, perfect for sharing or satisfying your hunger solo.',
      location: '1st Floor',
      image: 'assets/stalls/greenkiosk.jpg',
    ),
    Stall(
      id: 8,
      name: 'Dinette, etc',
      priceRange: '₱25 - ₱50',
      description:
          'Dinette, etc provides a casual dining experience with its selection of burgers and snacks. Their burger with fries is a favorite, while the chicken nuggets combo offers a satisfying option for those craving comfort food.',
      location: '1st Floor',
      image: 'assets/stalls/dinette.jpg',
    ),
    Stall(
      id: 9,
      name: 'Kiosk 1',
      priceRange: '₱20 - ₱55',
      description:
          'This kiosk specializes in delicious waffles and French toast. Whether you prefer plain or hotdog waffles, Kiosk 1 has a sweet or savory option for everyone. Pair your treat with a hot chocolate or iced coffee for a delightful snack break.',
      location: '1st Floor',
      image: 'assets/stalls/kiosk1.jpg',
    ),
    Stall(
      id: 10,
      name: 'Kiosk 2',
      priceRange: '₱40 - ₱55',
      description:
          'Kiosk 2 serves traditional Filipino dishes, including pork adobo and chicken curry. Each meal is prepared with authentic flavors, providing a taste of home in every bite. Perfect for those seeking hearty, familiar meals.',
      location: '1st Floor',
      image: 'assets/stalls/kiosk2.jpg',
    ),
    Stall(
      id: 11,
      name: 'Kiosk 3',
      priceRange: '₱45 - ₱55',
      description:
          'Known for its comfort meals, Kiosk 3 offers fried chicken, lumpia, and classic Filipino favorites like pork sinigang and chicken inasal. Each dish promises to warm your heart and satisfy your taste buds.',
      location: '1st Floor',
      image: 'assets/stalls/kiosk3.jpg',
    ),
    Stall(
      id: 12,
      name: 'Kiosk 4',
      priceRange: '₱40 - ₱50',
      description:
          'Kiosk 4 presents a selection of beloved Filipino comfort food, including pork sisig and chicken adobo. With delicious home-cooked flavors, this kiosk is a must-visit for fans of traditional meals.',
      location: '1st Floor',
      image: 'assets/stalls/kiosk4.jpg',
    ),
    Stall(
      id: 13,
      name: 'Kiosk 5',
      priceRange: '₱40 - ₱55',
      description:
          "Offering a customizable experience, Kiosk 5 allows you to pick your carenderia meal, which includes rice, one meat, and one veggie. This flexibility, along with favorites like chicken afritada, ensures there's something for everyone.",
      location: '1st Floor',
      image: 'assets/stalls/kiosk5.jpg',
    ),
    Stall(
      id: 14,
      name: 'Kiosk 6, 7, 8',
      priceRange: '₱60 - ₱75',
      description:
          'For those looking for a more filling meal, these kiosks provide hearty options like pork BBQ and beef caldereta. Each dish is generously portioned, making it an ideal choice for a substantial lunch or dinner.',
      location: '1st Floor',
      image: 'assets/stalls/kiosk678.jpg',
    ),
    Stall(
      id: 15,
      name: 'Kiosk 9',
      priceRange: '₱30 - ₱35',
      description:
          'Another great waffle destination, Kiosk 9 serves up a variety of waffle options with delicious toppings like cheese and yema. Perfect for a light snack or a sweet treat to brighten your day.',
      location: '1st Floor',
      image: 'assets/stalls/kiosk9.jpg',
    ),
    Stall(
      id: 16,
      name: 'Kiosk 10',
      priceRange: '₱20 - ₱55',
      description:
          'Kiosk 10 is a go-to spot for classic Filipino street food. Enjoy favorites like isaw, betamax, and kikiam, or try their refreshing buko juice and melon shake for a satisfying snack break.',
      location: '1st Floor',
      image: 'assets/stalls/kiosk10.jpg',
    ),
    Stall(
      id: 17,
      name: 'Kiosk 11',
      priceRange: '₱20 - ₱55',
      description:
          'Kiosk 11 offers a variety of Filipino snacks and drinks, including fish balls, kwek-kwek, and refreshing gulaman. Their selection of street food favorites is perfect for those looking to enjoy classic flavors on the go.',
      location: '1st Floor',
      image: 'assets/stalls/kiosk11.jpg',
    ),
    Stall(
      id: 18,
      name: 'Kiosk 12',
      priceRange: '₱20 - ₱60',
      description:
          'This kiosk is a haven for snack lovers, offering a selection of sweet treats like puto and kutsinta. For a refreshing drink, try their ube matcha lemonade or bubble teas, perfect for cooling off on warm days.',
      location: '1st Floor',
      image: 'assets/stalls/kiosk12.jpg',
    ),
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

  @override
  Widget build(BuildContext context) {
    final filteredStalls = stalls.where((stall) {
      return selectedLocations.isEmpty ||
          selectedLocations.contains(stall.location);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[850],
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/coop.jpg'),
                  radius: 20,
                ),
                SizedBox(width: 8),
                Text(
                  'WVSU Canteen',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                _buildNavButton(context, 'Home', false),
                _buildNavButton(context, 'Stalls', true),
                _buildNavButton(context, 'About Us', false),
                _buildNavButton(context, 'Contact Us', false),
              ],
            ),
          ],
        ),
      ),
      body: Column(
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

          // Stall grid
          Expanded(
            child: filteredStalls.isNotEmpty
                ? GridView.builder(
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: filteredStalls.length,
                    itemBuilder: (context, index) {
                      final stall = filteredStalls[index];
                      return GestureDetector(
                        onTap: () => handleSelectStall(index),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Image.asset(
                                stall.image,
                                fit: BoxFit.cover,
                                height: 120,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  stall.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  stall.priceRange,
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : const Center(child: Text('No stalls available')),
          ),
        ],
      ),
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
