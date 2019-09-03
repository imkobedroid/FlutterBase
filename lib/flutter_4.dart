import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//我们假设一个购物应用程序，该应用程序显示出售的各种产品，并维护一个购物车

void main() {
  runApp(new MaterialApp(
    title: 'Shopping App',
    home: new ShoppingList(
      products: <Product>[
        new Product(name: 'Eggs'),
        new Product(name: 'Flour'),
        new Product(name: 'Chocolate chips'),
      ],
    ),
  ));
}


class Product {
  const Product({this.name});

  final String name;
}


typedef void CartChangedCallback(Product product, bool inCart);


class ShoppingListItem extends StatelessWidget {

  ShoppingListItem({Product product, this.inCart, this.onCartChanged})
      :product=product,
        super(key: new ObjectKey(product));


  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;


  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme
        .of(context)
        .primaryColor;
  }


  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;
    return new TextStyle(
        color: Colors.black54, decoration: TextDecoration.lineThrough);
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(onTap: () {
      onCartChanged(product, !inCart);
    }, leading: new CircleAvatar(
      backgroundColor: _getColor(context),
      child: new Text(product.name[0]),
    ), title: new Text(product.name, style: _getTextStyle(context)));
  }

}


class ShoppingList extends StatefulWidget {

  ShoppingList({Key key, this.products}) :super(key: key);
  final List<Product> products;

  @override
  _ShoppingListState createState() {
    return new _ShoppingListState();
  }
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = new Set<Product>();


  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (inCart) {
        _shoppingCart.remove(product);
      } else {
        _shoppingCart.add(product);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(appBar: new AppBar(title: new Text("Shopping List"),
    ), body: new ListView(
      padding: new EdgeInsets.symmetric(vertical: 8),
      children: widget.products.map((Product product) {
        return new ShoppingListItem(product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged);
      }).toList(),
    ),);
  }

}