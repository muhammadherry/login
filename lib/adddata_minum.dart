
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddDataMinum extends StatefulWidget{
  @override
  _AddDataState createState()=> new _AddDataState();
}

class _AddDataState extends State<AddDataMinum>{
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

  int radioValue = 0;
  void handleradioValue(int value){
    setState(() {
      radioValue = value;
      print(radioValue);
    });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.blue[300],
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 580.0,
                  color: Colors.blue[290],
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          new Image.asset('assets/logotol1.png',width: 200.0,),

                          SizedBox(height: 50.0),
                          Container(
                            height: 50.0,
                            width: 350,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(2)
                            ),
                            child: TextField(
                              /*  controller: controllerName,
                              decoration: new InputDecoration(
                                  hintText: "Nama Minuman",
                                  labelText: "Nama Minuman",

                              ),*/
                              controller: controllerName,
                              decoration: InputDecoration(
                                  hintText:'Nama Minuman',
                                  icon: Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Icon(Icons.fastfood,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide.none
                                  )
                              ),
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Container(
                            height: 50.0,
                            width: 350,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(2)
                            ),

                            child: TextField(
                              controller: controllerPrice,
                              decoration: new InputDecoration(
                                  hintText:'price',
                                  icon: Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Icon(Icons.attach_money,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide.none
                                  )
                              ),
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Container(
                            height: 50.0,
                            width: 350,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(2)
                            ),

                            child: TextField(
                              controller: controllerAn,
                              decoration: new InputDecoration(
                                hintText: "Atas nama",
                                icon: Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Icon(Icons.supervised_user_circle,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Container(
                            height: 50.0,
                            width: 350,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(2)
                            ),
                            child: TextField(
                              controller: controllerDeskripsi,
                              decoration: new InputDecoration(
                                hintText: "Deskripsi",
                                icon: Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Icon(Icons.description,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                              children: <Widget>[
                                Radio(
                                  groupValue: radioValue,
                                  activeColor: Colors.orangeAccent,
                                  onChanged: handleradioValue,
                                  value: 0,
                                ),
                                Text('Cash',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Radio(
                                  groupValue: radioValue,
                                  activeColor: Colors.orangeAccent,
                                  onChanged: handleradioValue,
                                  value: 1,
                                ),
                                Text('Go-Pay',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),Radio(
                                  groupValue: radioValue,
                                  activeColor: Colors.orangeAccent,
                                  onChanged: handleradioValue,
                                  value: 2,
                                ),
                                Text('Ovo',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ]
                          ),
                          SizedBox(height: 20.0,),
                          Container(
                            height: 50.0,
                            width: 350.0,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(2)
                            ),
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  addData();
                                  Navigator.pop(context);
                                },
                                child: new Text("Pesan Minuman"),
                              ),
                            ),
                          )
                        ],
                      ),

                    ],
                  ),
                )
              ],
            ),
            /*  Column(
              children: <Widget>[
                Container(
                  height: 90.0,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 23,
                      itemBuilder: (context,index){
                        return Column(
                          children: <Widget>[
                            Material(
                                elevation: 0.0,
                                shape: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey
                                    )
                                ),
                                child: Container(
                                  height: 90.0,
                                  width: 130.0,

                                  //elevation: 0.0,
                                  *//*child: Column(
                                    children: <Widget>[
                                      SizedBox(height: 20.0),
                                      Icon(Icons.card_travel),
                                      SizedBox(height: 10.0,),
                                      Text('Cabs'),
                                    ],
                                  ),*//*
                                  child: Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.asset('assets/1b1.png',
                                          width: 50.0, height: 50.0),

                                    ),),
                                )
                            )
                            //SizedBox(width: 30.0),
                          ],
                        );
                      }),
                ),
              ],
            ),*/
            /*  SizedBox(height: 10.0,),
            Container(
              height: 2.0,
              color: Colors.grey[400],
            ),*/


          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.orange,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text('Search')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.details),
                title: Text('Deals')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.attach_money),
                title: Text('ixigo money')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.trip_origin),
                title: Text('My Trips')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                title: Text('Profile')
            ),
          ],
        ),
      ),
    );
  }
}




/*

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddDataMinum extends StatefulWidget{
  @override
  _AddDataMinumState createState()=> new _AddDataMinumState();
}

class _AddDataMinumState extends State<AddDataMinum>{
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
        */
/* appBar: new AppBar(
        title: new Text("Add Data"),
      ),*//*

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
    'Pesan Minuman',
    style: TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: "Pacifico"
    ),
    ),
    */
/*SizedBox(height:10,),
                        Text("Logo",style: TextStyle(color:Colors.white,fontSize: 18),),*//*


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
    hintText: "Nama Minuman",
    labelText: "Nama Minuman"
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
*/
