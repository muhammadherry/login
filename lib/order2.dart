
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class order2 extends StatefulWidget{
  @override
  _order2State createState()=> new _order2State();
}

class _order2State extends State<order2>{
  Future<List> getData() async{
    final response= await http.get("http://10.0.2.2/my_store/getdata.php");
    return json.decode(response.body);
  }
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      /* appBar: new AppBar(
        title: new Text("Add Data"),
      ),*/
      body:
      Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                    Colors.blue[800],
                    Colors.blue[300],
                    Colors.blue[100],

                  ]
              )
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height:80,),
                Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 1.0,),
                        Text(
                          'Order',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: "Pacifico"
                          ),
                        ),
                        /*SizedBox(height:10,),
                        Text("Logo",style: TextStyle(color:Colors.white,fontSize: 18),),*/

                      ],
                    )
                ),
                SizedBox(height:20,),
                Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60))
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height:60,),
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [BoxShadow(
                                      color: Color.fromRGBO(225, 95, 27, .3),
                                      blurRadius:20,
                                      offset: Offset(0,10)
                                  )]
                              ),
                              child: Column(
                                children:<Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(color: Colors.white))
                                    ),
                                    child: new FutureBuilder<List>(
                                      future: getData(),
                                      builder:(context,snapshot){
                                        if(snapshot.hasError) print(snapshot.error);
                                        return snapshot.hasData
                                            ? new ItemList(list: snapshot.data,)
                                            : new Center( child: new CircularProgressIndicator(),);
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    )
                )
              ]
          )
      ),
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