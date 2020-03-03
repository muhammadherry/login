
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OrderPage extends StatefulWidget{
  @override
  _OrderPageState createState()=> new _OrderPageState();
}

class _OrderPageState extends State<OrderPage>{
  Future<List> getData() async{
    final response= await http.get("http://10.0.2.2/my_store/getdata.php");
    return json.decode(response.body);
  }
  @override
  Widget build(BuildContext context){
    return MaterialApp(
        home: Container(

          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/blue.png"), fit: BoxFit.cover)),

          child:  Scaffold(
            body: new FutureBuilder<List>(

              future: getData(),
              builder:(context,snapshot){
                if(snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? new ItemList(list: snapshot.data,)
                    : new Center( child: new CircularProgressIndicator(),);

              },

            ),

            /*  body: new Center(
        child: new Text("HomePage",style: new TextStyle(fontSize: 35.0),),
      ),*/

          ),

        )
    );


  }

}
class ItemList extends StatelessWidget{
  List list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context){
    return new ListView.builder(
      itemCount: list==null ? 0 : list.length,
      itemBuilder: (context,i){
        return new Container(
          padding: const EdgeInsets.all(5.0),
          child: new GestureDetector(
            onTap: (){},/*=>Navigator.of(context).push(
                new MaterialPageRoute(
                    builder:(BuildContext context)=> new Detail(list: list,index: i,)
                )
            ),*/
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['item_name']),
                leading: new Icon(Icons.widgets),
                subtitle: new Text("Status: ${list[i]['status']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}