import 'package:flutter/material.dart';
import 'package:meals_app/cart_screen.dart';
import 'package:meals_app/categroy_screen.dart';
import 'package:meals_app/drawer_screen.dart';
import 'package:meals_app/favorite_screen.dart';
import 'package:meals_app/providers/cart.dart';
import 'package:meals_app/widgets/badge.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatefulWidget {
   static final String routeName='/tabSceen';
  TabsScreen();

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Widget> pages;

  int selectedIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    pages = [CategoryScreen(), FavoriteScreen()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Food App'),
        actions: selectedIndex == 1
            ? <Widget>[]
            : <Widget>[
                Consumer<Cart>(
                  builder: (_, cart, ch) => Badge(
                    child: ch,
                    value: cart.itemCount.toString(),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(CartScreen.routeName);
                    },
                  ),
                )
              ],
      ),
      drawer: Drawer(
        child: DrawerScreen(),
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        //type: BottomNavigationBarType.shifting,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white70,
        selectedItemColor: Colors.white,
        onTap: _selectedPage,
        items: [
          BottomNavigationBarItem(
              //backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('Category')),
          BottomNavigationBarItem(
              //backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.favorite),
              title: Text('Favorite'))
        ],
      ),
    );
  }
}
