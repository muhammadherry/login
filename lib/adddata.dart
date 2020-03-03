
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget{
  @override
  _AddDataState createState()=> new _AddDataState();
}

class _AddDataState extends State<AddData>{
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
                                  hintText:'Nama Makanan',
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
                                child: new Text("Pesan Makanan"),
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
