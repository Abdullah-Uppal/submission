import 'package:flutter/material.dart';

class MyHomePage2 extends StatefulWidget {
  MyHomePage2({super.key});

  @override
  State<MyHomePage2> createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  final _controller = PageController();

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Myntra"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_box_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_outline_rounded),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoriesRow(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 300,
                  child: PageView.builder(
                    pageSnapping: true,
                    onPageChanged: (value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
                    controller: _controller,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        'assets/images/clothes.jpg',
                        fit: BoxFit.cover,
                      );
                    },
                    itemCount: 4,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...[0, 1, 2, 3].map((e) {
                  if (e == currentIndex) {
                    return const Icon(
                      Icons.circle,
                      size: 10,
                    );
                  }
                  return const Icon(
                    Icons.circle_outlined,
                    size: 10,
                  );
                }),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Featured"),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return FeaturedTiles(
                            image: index.isOdd
                                ? Image.asset(
                                    'assets/images/bg.png',
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset('assets/images/clothes.jpg',
                                    fit: BoxFit.cover),
                            title: "T-Shirt");
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                      itemCount: 10,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("All Time Favorites"),
            ),
            FavoritesGrid(),
          ],
        ),
      ),
    );
  }
}

class FeaturedTiles extends StatelessWidget {
  const FeaturedTiles({super.key, required this.image, required this.title});
  final Image image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: Stack(
        children: [
          Container(
            height: 150,
            width: 100,
            color: Colors.blueGrey[900],
            child: image,
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              "T-Shirt",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FavoritesGrid extends StatelessWidget {
  const FavoritesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTile(
                child: Image.asset(
              'assets/images/clothes.jpg',
              fit: BoxFit.cover,
            )),
          );
        },
        itemCount: 20,
      ),
    );
  }
}

class CategoriesRow extends StatelessWidget {
  CategoriesRow({super.key});
  final categories = [
    "Men",
    "Women",
    "Kids",
    "Footwear",
    "Beauty",
    "Legends",
    "YAY"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: 60,
                    width: 60,
                    color: Colors.blueGrey[900],
                    child: Image.asset('assets/images/bg.png'),
                  ),
                ),
                Text(categories[index]),
              ],
            ),
          );
        },
        itemCount: 7,
      ),
    );
  }
}
