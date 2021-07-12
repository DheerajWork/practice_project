
import 'package:flutter/material.dart';

class FlutterChips extends StatefulWidget {
  @override
  _FlutterChipsState createState() => _FlutterChipsState();
}

class _FlutterChipsState extends State<FlutterChips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: (){},
        ),
        title: Text('Filter Result'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.home,color: Colors.white,))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10,top: 10),
            child: _titleText('Choose Color'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Wrap(
                  spacing: 5,
                  runSpacing: 3,
                  children: [
                    FilterChipsWidget(chipName: 'Red'),
                    FilterChipsWidget(chipName: 'Yellow'),
                    FilterChipsWidget(chipName: 'Green'),
                    FilterChipsWidget(chipName: 'Pink'),
                    FilterChipsWidget(chipName: 'Black'),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget _titleText (String myTitle) {
  return Text(
    myTitle,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 17
    ),
  );
}

class FilterChipsWidget extends StatefulWidget {
  final String chipName;

  const FilterChipsWidget({Key? key, required this.chipName}) : super(key: key);
  @override
  _FilterChipsWidgetState createState() => _FilterChipsWidgetState();
}

class _FilterChipsWidgetState extends State<FilterChipsWidget> {
  var _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.chipName),
      labelStyle: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),
      selected: _isSelected,
      backgroundColor: Color(0xffededed),
      onSelected: (isSelect){
        setState(() {
          _isSelected = isSelect;
        });
      },
      selectedColor: Colors.green,
    );
  }
}

