import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider_ecommerce_app/model/cart_model.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        /*actions: [
          Badge(
            position: BadgePosition.topEnd(top: 0, end: 5),
            animationType: BadgeAnimationType.slide,
            animationDuration: Duration(milliseconds: 300),
            badgeContent: Text(
              '${Provider.of<CartModel>(context,listen: false).cartItems.length}',
              style: TextStyle(color: Colors.white),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart_outlined),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart())),
            ),
          )
        ],
*/
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(32),
              child: _CartList(),
            )),
            Divider(
              height: 4,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}


class _CartList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      var hugestyle =
    Theme.of(context).textTheme.headline2.copyWith(fontSize: 20);
    return SizedBox(
      height: 100,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Another way to listen to a model's change is to include
            // the Consumer widget. This widget will automatically listen
            //to CartModel and rerun its builder on every change.
            //
            // The important thing is that it will not rebuild
            // the rest of the widgets in this build method.
            Consumer<CartModel>(
              builder: (context, cart, child) => Text(
                '\$${cart.current}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
            SizedBox(
              width: 24,
            ),
            TextButton(
              onPressed: () {
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('Buying not Supported yet')));
              },
              style: TextButton.styleFrom(primary: Colors.white),
              child: Text('Buy',style: TextStyle(color: Colors.orangeAccent,fontSize: 48),),
            )
          ],
        ),
      ),
    );
  }
}

