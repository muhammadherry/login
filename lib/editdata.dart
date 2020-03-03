import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login/home_page.dart';


class EditData extends StatefulWidget{
  final List list;
  final int index;

  EditData({this.list,this.index});
  @override
  _EditDataState createState()=> new _EditDataState();
}

class _EditDataState extends State<EditData>{
//Controller
  TextEditingController controllerCode;
  TextEditingController controllerName;
  TextEditingController controllerPrice;
  TextEditingController controllerStatus;

  void editData(){
    var url="http://10.0.2.2/my_store/editdata.php";
    http.post(url,body: {
      "id": widget.list[widget.index]['id'],
      "itemcode": controllerCode.text,
      "itemname": controllerName.text,
      "price": controllerPrice.text,
      "status": controllerStatus.text,

    });
  }
  @override
  void initState(){
    controllerCode= new TextEditingController(text: widget.list[widget.index]['item_code']);
    controllerName= new TextEditingController(text: widget.list[widget.index]['item_name']);
    controllerPrice= new TextEditingController(text: widget.list[widget.index]['price']);
    controllerStatus= new TextEditingController(text: widget.list[widget.index]['status']);
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Edit Data"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new TextField(
                    controller: controllerCode,
                    decoration: new InputDecoration(
                        hintText: "Item Code",
                        labelText: "Item Code"
                    ),
                  ),
                  new TextField(
                    controller: controllerName,
                    decoration: new InputDecoration(
                        hintText: "Item Name",
                        labelText: "Item Name"
                    ),
                  ),
                  new TextField(
                    controller: controllerPrice,
                    decoration: new InputDecoration(
                        hintText: "Price",
                        labelText: "Price"
                    ),
                  ),
                  new TextField(
                    controller: controllerStatus,
                    decoration: new InputDecoration(
                        hintText: "Status",
                        labelText: "Status"
                    ),
                  ),
                  new Padding(padding: const EdgeInsets.all(10.0),),
                  new RaisedButton(
                    child: new Text("Update Data"),
                    color: Colors.lightBlueAccent,
                    onPressed: (){
                      editData();
                      //Back to First Page
                      Navigator.of(context).push(
                          new MaterialPageRoute(
                              builder: (BuildContext context)=>new HomePage()
                          )
                      );
                    },
                  )
                ],
              ),
            ],
          )
      ),
    );
  }
}