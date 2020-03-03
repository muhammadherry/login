
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddDataSpatu extends StatefulWidget{
  @override
  _AddDataSpatuState createState()=> new _AddDataSpatuState();
}

class _AddDataSpatuState extends State<AddDataSpatu>{
  //Controller
  TextEditingController controllerCode = new TextEditingController();
  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerPrice = new TextEditingController();
  TextEditingController controllerStock = new TextEditingController();
  TextEditingController controllerAn = new TextEditingController();
  TextEditingController controllerDeskripsi = new TextEditingController();


  //ADD DATA
  void addData(){
    var url="http://10.0.2.2/my_store/adddata.php";
    http.post(url,body:{
      "itemcode": controllerCode.text,
      "itemname": controllerName.text,
      "price": controllerPrice.text,


      "an": controllerAn.text,
      "deskripsi": controllerDeskripsi.text,
    });
  }


  @override
  Widget build(BuildContext context){
    return new Scaffold(
      /* appBar: new AppBar(
        title: new Text("Add Data"),
      ),*/
      body: Container(
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
                          'Ambil Sepatu',
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
                                        border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                    ),
                                    child: new TextField(
                                      controller: controllerName,
                                      decoration: new InputDecoration(
                                          hintText: "Merk",
                                          labelText: "Nama Sepatu"
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                    ),
                                    child:  new TextField(
                                      controller: controllerPrice,
                                      decoration: new InputDecoration(
                                          hintText: "Price",
                                          labelText: "Price"
                                      ),
                                    ),

                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                    ),
                                    child:   new TextField(
                                      controller: controllerAn,
                                      decoration: new InputDecoration(
                                          hintText: "Atas nama",
                                          labelText: "Atas Nama"
                                      ),
                                    ),

                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                    ),
                                    child:  new TextField(
                                      controller: controllerDeskripsi,
                                      decoration: new InputDecoration(
                                          hintText: "Deskripsi",
                                          labelText: "Deskripsi"
                                      ),
                                    ),

                                  )
                                ],
                              ),
                            ),
                            new Padding(padding: const EdgeInsets.all(10.0),),
                            new RaisedButton(
                              child: new Text("Pesan"),
                              color: Colors.lightBlueAccent,
                              onPressed: (){
                                addData();
                                //Back to First Page
                                Navigator.pop(context);
                              },
                            )
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
