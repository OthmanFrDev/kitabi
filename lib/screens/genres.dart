import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitabi_app/bookFinder/books_finder.dart';
import 'package:kitabi_app/book_services/authentication.dart';
import 'package:kitabi_app/book_services/services.dart';
import 'package:kitabi_app/screens/books.dart';
import 'package:kitabi_app/widgets/resuableCard.dart';
import 'package:kitabi_app/widgets/textfield_decoration.dart';

class Genres extends StatelessWidget {
  bool isClicked = false;
  String? name = '';
  BookServices service = BookServices();  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.book),
        title: const Text(
          'Select Genre',
          style:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w500),
        ),
        actions: <Widget>[
          FlatButton.icon(onPressed: () async =>{
            await signOut()
          },
            icon: const Icon(Icons.logout),
            label: const Text("Logout"),
              )
        ],

      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              TextFieldDecoration(),
              ReusableCard(
                color: Colors.green,
                text: 'Fiction',
                onTap: ()=> {
                  Get.to(Books(), arguments: 'fiction')
                },
              ),
              ReusableCard(
                color: Colors.yellow,
                text: 'Comedy',
                onTap: ()=> {
                  Get.to(Books(), arguments: 'comedy')
                },
              ),
              ReusableCard(
                color: Colors.pinkAccent,
                text: 'Romance',
                onTap:()=>Get.to(Books(), arguments: 'romance'),
              ),
              ReusableCard(
                color: Colors.redAccent,
                text: 'Drama',
                onTap: () =>{
                  Get.to(Books(), arguments: 'drama')
                },
              ),
              ReusableCard(
                color: Colors.green,
                text: 'Science',
                onTap: () =>{
                  Get.to(Books(), arguments: 'science')
                },
              ),
              ReusableCard(
                color: Colors.purpleAccent,
                text: 'Computers',
                onTap: () =>{
                  Get.to(Books(), arguments: 'computers')
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Text('Copyright Fr & Ke',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,fontFamily: 'Montserrat'
                      )),
                ),
              )
            ],
          ))
        ],
      )),
    );
  }
}
