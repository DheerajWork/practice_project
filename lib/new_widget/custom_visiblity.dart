import 'package:flutter/material.dart';

class CustomVisibility extends StatefulWidget {
  @override
  _CustomVisibilityState createState() => _CustomVisibilityState();
}

class _CustomVisibilityState extends State<CustomVisibility> {

   bool _isSelect = true;
   bool _isVisible = true;

   int i = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 10,
              floating: true,
              pinned: true,
              snap: true,
              title: Text('Sliver App Bar',style: TextStyle(color: Colors.lightGreenAccent),),
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network('https://images.pexels.com/photos/7239620/pexels-photo-7239620.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',fit: BoxFit.cover,),
              ),
            ),
           SliverList(delegate: SliverChildListDelegate(
             [
               Column(
                 children: [
                   // ignore: deprecated_member_use
                   RaisedButton(onPressed: (){
                     setState(() {
                       _isVisible = !_isVisible;
                     });
                   },child: Text('Press'),),
                   Visibility(
                       visible: _isVisible,
                       child: Icon(Icons.camera,size: 150,)
                   ),

                   GestureDetector(
                     onTap: (){
                       setState(() {
                         _isSelect = !_isSelect;
                         print(_isSelect);
                       });
                     },
                     child: Container(
                       height: 100,
                       width: 100,
                       child: Center(child: Text('Fitted Box')),
                       color: _isSelect==true?Colors.red:Colors.yellow,
                     ),
                   ),

                   // ignore: deprecated_member_use
                   RaisedButton(onPressed: (){
                     setState(() {
                       _isVisible = !_isVisible;
                     });
                   },child: Text('Press'),),
                   Visibility(
                       visible: _isVisible,
                       child: Icon(Icons.camera,size: 150,)
                   ),

                   GestureDetector(
                     onTap: (){
                       setState(() {
                         _isSelect = !_isSelect;
                         print(_isSelect);
                       });
                     },
                     child: Container(
                       height: 100,
                       width: 100,
                       child: Center(child: Text('Fitted Box')),
                       color: _isSelect==true?Colors.red:Colors.yellow,
                     ),
                   ),

                   // ignore: deprecated_member_use
                   RaisedButton(onPressed: (){
                     setState(() {
                       _isVisible = !_isVisible;
                     });
                   },child: Text('Press'),),
                   Visibility(
                       visible: _isVisible,
                       child: Icon(Icons.camera,size: 150,)
                   ),

                   GestureDetector(
                     onTap: (){
                       setState(() {
                         _isSelect = !_isSelect;
                         print(_isSelect);
                       });
                     },
                     child: Container(
                       height: 100,
                       width: 100,
                       child: Center(child: Text('Fitted Box')),
                       color: _isSelect==true?Colors.red:Colors.yellow,
                     ),
                   ),

                   // ignore: deprecated_member_use
                   RaisedButton(onPressed: (){
                     setState(() {
                       _isVisible = !_isVisible;
                     });
                   },child: Text('Press'),),
                   Visibility(
                       visible: _isVisible,
                       child: Icon(Icons.camera,size: 150,)
                   ),

                   GestureDetector(
                     onTap: (){
                       setState(() {
                         _isSelect = !_isSelect;
                         print(_isSelect);
                       });
                     },
                     child: Container(
                       height: 100,
                       width: 100,
                       child: Center(child: Text('Fitted Box')),
                       color: _isSelect==true?Colors.red:Colors.yellow,
                     ),
                   ),

                   // ignore: deprecated_member_use
                   RaisedButton(onPressed: (){
                     setState(() {
                       _isVisible = !_isVisible;
                     });
                   },child: Text('Press'),),
                   Visibility(
                       visible: _isVisible,
                       child: Icon(Icons.camera,size: 150,)
                   ),

                   GestureDetector(
                     onTap: (){
                       setState(() {
                         _isSelect = !_isSelect;
                         print(_isSelect);
                       });
                     },
                     child: Container(
                       height: 100,
                       width: 100,
                       child: Center(child: Text('Fitted Box')),
                       color: _isSelect==true?Colors.red:Colors.yellow,
                     ),
                   ),

                   // ignore: deprecated_member_use
                   RaisedButton(onPressed: (){
                     setState(() {
                       _isVisible = !_isVisible;
                     });
                   },child: Text('Press'),),
                   Visibility(
                       visible: _isVisible,
                       child: Icon(Icons.camera,size: 150,)
                   ),

                   GestureDetector(
                     onTap: (){
                       setState(() {
                         _isSelect = !_isSelect;
                         print(_isSelect);
                       });
                     },
                     child: Container(
                       height: 100,
                       width: 100,
                       child: Center(child: Text('Fitted Box')),
                       color: _isSelect==true?Colors.red:Colors.yellow,
                     ),
                   )
                 ],
               )
             ]
           ))
          ],
        ),
      ),
    );
  }
}
