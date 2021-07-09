import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ecommerce_app/screens/cart.dart';
import 'package:provider_ecommerce_app/model/cart_model.dart';

void main() {
  runApp(ChangeNotifierProvider<CartModel>(
      create: (_) => CartModel(), child: MaterialApp(home: MyApp())));
}

class MyApp extends StatelessWidget {
  List<Item> items = [
    new Item('Arm Chair', 0, 'assets/armchair.jpg', 500),
    new Item('Arm Rest Chair', 0, 'assets/armrestchair.jpg', 250),
    new Item('Bar Stool', 0, 'assets/barstool.jpg', 550),
    new Item('Bean Bag', 0, 'assets/beanbag.jpg', 300),
    new Item('Leone Lounge Chair', 0, 'assets/leonelounge.jpg', 1000),
    new Item('Office Chair', 0, 'assets/officechair.jpg', 700),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Cart Demo'),
        actions: [
          Badge(
            position: BadgePosition.topEnd(top: 0, end: 5),
            animationType: BadgeAnimationType.slide,
            animationDuration: Duration(milliseconds: 300),
            badgeContent: Text(
              '${context.watch<CartModel>().cartItems.length}',
              style: TextStyle(color: Colors.white),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart_outlined),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart())),
            ),
          )
        ],
      ),
      body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 10,
          children: List.generate(
              items.length,
              (index) => Center(
                    child: SelectedCard(
                        item: items[index], index: index, itemlist: items),
                  ))),
    );
  }
}

class Item {
  final String name;
  final int count;
  final String imageUrl;
  final double price;

  Item(this.name, this.count, this.imageUrl, this.price);
}

class SelectedCard extends StatelessWidget {
  final Item item;
  final int index;
  final List<Item> itemlist;

  const SelectedCard({Key key, this.item, this.index, this.itemlist})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              item.imageUrl,
              width: 100,
              height: 100,
            ),
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Text(item.name), Text('\$${item.price}')],
            ),
            context.read<CartModel>().cartItems.containsKey(index)
                ? Text('Added')
                : ElevatedButton(
                    onPressed: () {
                      Provider.of<CartModel>(context, listen: false)
                          .addItem(index);
                      Provider.of<CartModel>(context, listen: false)
                          .totalPrice(item.price);
                    },
                    style:
                        ElevatedButton.styleFrom(primary: Colors.orangeAccent),
                    child: Center(
                        child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ))),
          ],
        ),
      ),
    );
  }
}
