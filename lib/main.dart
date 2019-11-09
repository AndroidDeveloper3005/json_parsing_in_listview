import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http; // make as http for use ....
// if package:http/http.dart does not show we need to add http version inside like this http: ^0.12.0+2

void main() async{ // why async? becouse we are retruning some async value/
List _data = await getJson();//get data

runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Json Parsing.."),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _data.length,// we need a list of data for that we are going to create a list
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (BuildContext context ,  int position){
            //for divider
            if(position.isOdd){
              return Divider();
            }
            return ListTile(
              title: Text("${_data[position]['id']}",
              style: TextStyle(fontSize: 18.9),
            ));
          },// passing context and position
        ),// before implimenting this we need to implement some function for get json data

      ),
    ),

)
);

}
// we need to create a function with future type.we use this because we get some data in future or after some time

Future<List>getJson() async{
  //main url
  String apiUrl ='https://jsonplaceholder.typicode.com/photos';
  //http response
  http.Response response = await http.get(apiUrl);
  //return type
  return jsonDecode(response.body);// we need to converet data into json format
}


