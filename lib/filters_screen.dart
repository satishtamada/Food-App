import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static String routeName = 'filters_screen';
  final Function setFilters;
  Map<String,bool> filters;

  FiltersScreen(this.filters,this.setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool isVeg = false;
  bool isSugerFree = false;

  Widget getListItem(
      String title, String desc, bool defaultValue, Function function) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(desc),
      onChanged: function,
      value: defaultValue,
    );
  }

  @override
  void initState() {
    isVeg=widget.filters['veg'];
    isSugerFree=widget.filters['sugar_free'];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed:(){
              final selectedFilter={
                'veg':isVeg,
                'sugar_free':isSugerFree,
              };
              widget.setFilters(selectedFilter);
              Navigator.of(context).pop();
            } ,
          )
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Change menu',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  getListItem("Sugar Free", "enable sugar free", isSugerFree,
                      ((value) {
                    setState(() {
                      isSugerFree = value;
                    });
                  })),
                  getListItem("veg", "enable only veg", isVeg, ((value) {
                    setState(() {
                      isVeg = value;
                    });
                  })),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
