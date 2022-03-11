import 'dart:async';

import 'package:flutter/material.dart';

class NetworkImageModified extends StatelessWidget{
  final String url;
  NetworkImageModified(this.url);
  Future<bool> cacheImage(String url,BuildContext context) async {
    bool hasNoError=true;
    var output=Completer<bool>();
    precacheImage(
        NetworkImage(url),
        context,
        onError: (e,stackTrace)=>hasNoError=false,
    ).then((_)=>output.complete(hasNoError));
    return output.future;
  }
  @override
  Widget build(context){
    return FutureBuilder(
      future:cacheImage(url, context),
      builder: (context,snapshot){
        if(snapshot.connectionState==ConnectionState.none||snapshot.hasError){
          return Container(
            height: 80.0,
            decoration: BoxDecoration(
                color: Colors.grey
            ),
            child: Center(
              child: Text('Error',),
            ),
          );
        }
        if(snapshot.connectionState==ConnectionState.waiting){
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey
            ),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if(snapshot.data==false){
          return Container(
            height: 80.0,
            decoration: BoxDecoration(
                color: Colors.grey
            ),
            child: Center(
              child: Text('Error',style: TextStyle(fontSize: 10.0),),
            ),
          );
        }
        return Image.network(url);
      },
    );
  }
}