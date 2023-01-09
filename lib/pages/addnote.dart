import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  late String title;
  late String des;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child:Container(
            padding: EdgeInsets.all(12.0,),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.arrow_back_rounded,
                        size: 24.0,
                        ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.grey[700]
                        ),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 10.0,
                        )
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: add,
                      child: Text("Save",
                        style:TextStyle(
                          fontSize: 19.0,
                          fontFamily: "lato",
                          color: Colors.white,
                        ),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Colors.grey[700]
                          ),
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 10.0,
                        )),
                      ),
                    ),
                  ],
                ),
                SizedBox(height:35.0 ,),
                Form(child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration.collapsed(
                          hintText: "Title"
                      ),
                      style:TextStyle(
                        fontSize: 35.0,
                        fontFamily: "lato",
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[200],
                      ),
                      onChanged:(_val){
                        title =_val;
                      },
                    ),
                    // description
                    Container(
                      height: MediaQuery.of(context).size.height*0.75,
                      padding: const EdgeInsets.only(
                          top: 12.0
                      ),
                      child: TextFormField(
                        decoration: InputDecoration.collapsed(
                            hintText: "Note Description"
                        ),
                        style:TextStyle(
                          fontSize: 25.0,
                          fontFamily: "lato",
                          color: Colors.grey[500],
                        ),
                        onChanged:(_val){
                          des =_val;
                        },
                        maxLines: 20,
                      ),
                    ),
                  ],
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void add() async{
    //save to db
    CollectionReference ref =
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('notes');

    var data ={
      'title': title,
      'description':des,
      'created':DateTime.now(),
    };

    ref.add(data);
    
    Navigator.pop(context);
  }
}
