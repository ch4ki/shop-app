import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final String productId;
  final int quantity;
  final String title;
  CartItem(this.id, this.title, this.price, this.quantity,this.productId);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
      onDismissed: (direction) {
        Provider.of<Cart>(context,listen: false).removeItem(productId);
      },
      direction: DismissDirection.endToStart,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                  padding: EdgeInsets.all(5),
                  child: FittedBox(child: Text('\$$price'))),
            ),
            title: Text(title),
            subtitle: Text('\$${(quantity * price)}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
