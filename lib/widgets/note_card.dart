import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note/screens/home_screen.dart';
import 'package:note/style/app_style.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {

  deleteData(id)async{
    await FirebaseFirestore.instance.collection("notes").doc(id).delete();
  }

  return InkWell(
    // onDoubleTap: () async{
    //   await deleteData(id);
    // },
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppStyle.cardsColor[doc['color_id']],
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(doc["note_title"], style: AppStyle.mainTitle,),
          SizedBox(height: 6.0,),
          Text(doc["creation_date"], style: AppStyle.dateTitle,),
          SizedBox(height: 8.0,),
          Text(doc["note_content"], style: AppStyle.mainContent,
          overflow: TextOverflow.ellipsis,),
        ],
      ),
    ),
  );
}