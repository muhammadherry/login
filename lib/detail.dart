import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:login/home_page.dart';
import 'editdata.dart';


class Detail extends StatefulWidget{
  List list;
  int index;
  Detail({this.index,this.list});
  @override
  _DetailState createState()=> new _DetailState();
}

class _DetailState extends State<Detail>{

  void deleteData(){
    var url="http://10.0.2.2/my_store/deleteData.php";
    http.post(url, body:{
      'id':widget.list[widget.index]['id']
    });
  }
  void confirm(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Are you sure want to delete it'${widget.list[widget.index]['item_name']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("OK Delete",style: new TextStyle(color:Colors.white),),
          color: Colors.red,
          onPressed: (){
            deleteData();
            Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (BuildContext context)=>new HomePage(),
                )
            );
          },
        ),
        new RaisedButton(
          child: new Text("Cancel",style: new TextStyle(color:Colors.white),),
          color: Colors.greenAccent,
          onPressed: ()=> Navigator.pop(context),
        ),
      ],
    );
    showDialog(context: context, child: alertDialog);
  }
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text("${widget.list[widget.index]['item_name']}") ,),
      body: new Container(
        height: 250.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
            child: new Center(
              child: new Column(
                children: <Widget>[
                  new Padding(padding: const EdgeInsets.only(top:30.0)),
                  new Text(widget.list[widget.index]['item_name'],style: new TextStyle(fontSize: 20.0),),
                  new Text("Price:${widget.list[widget.index]['price']}",style: new TextStyle(fontSize: 18.0),),
                  new Text(widget.list[widget.index]['an'],style: new TextStyle(fontSize: 20.0),),
                  new Text(widget.list[widget.index]['deskripsi'],style: new TextStyle(fontSize: 20.0),),

                  new Padding(padding: const EdgeInsets.only(top:30.0)),

                  new Row(
                      mainAxisSize: MainAxisSize.min,
                      children:<Widget>[
                        new RaisedButton(
                          child: new Text("Update"),
                          color: Colors.greenAccent,
                          onPressed: ()=>Navigator.of(context).push(
                              new MaterialPageRoute(
                                builder:(BuildContext context)=> new EditData(list: widget.list, index:widget.index,),
                              )
                          ),
                        ),
                      /*  new RaisedButton(
                          child: new Text("Delete"),
                          color: Colors.redAccent,
                          onPressed: ()=>confirm(),
                        ),*/
                      ]
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}