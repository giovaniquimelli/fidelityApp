// import 'package:core/core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:ui/widgets/extra_components/CustomCircleAvatar.dart';
// import 'package:ui/widgets/extra_views/markdown_view.dart';

// class SharedUserDetail extends StatefulWidget {
//   final Account _account;
//   final Color _color;

//   const SharedUserDetail(this._account, this._color, {Key key})
//       : super(key: key);

//   @override
//   State<StatefulWidget> createState() {
//     return _SharedUserDetailState();
//   }
// }

// class _SharedUserDetailState extends State<SharedUserDetail> {
//   static GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     super.initState();

//     Global.service.aciveScaffoldKey = _scaffoldKey;
//   }


//   Widget _showUser(
//       double deviceWidth, double targetWidth, AuthProvider _authProvider) {
//     String _initial = '';
//     String _fullName = '';
//     String _personType = 'F';
//     String _username = '';

//     try {
//       _initial = _authProvider?.chosenAccount?.fullName
//               ?.substring(0, 1)
//               ?.toUpperCase() ??
//           '';
//     } catch (e) {
//       _initial = '';
//     }
//     _fullName = _authProvider?.chosenAccount?.fullName ?? 'Nome Completo';
//     if ((_authProvider?.chosenAccount?.legalName ?? '') == '') {
//       _personType = 'F';
//     } else {
//       _personType = 'J';
//     }
//     _username = _authProvider?.chosenAccount?.username ?? 'CPF/CNPJ';

//     if (_personType == 'F') {
//       try {
//         _username = _username.substring(0, 3) +
//             '.' +
//             _username.substring(3, 6) +
//             '.' +
//             _username.substring(6, 9) +
//             '-' +
//             _username.substring(9);
//       } catch (e) {
//         _username = '000.000.000-00';
//       }
//     } else {
//       try {
//         _username = _username.substring(0, 2) +
//             '.' +
//             _username.substring(2, 5) +
//             '.' +
//             _username.substring(5, 8) +
//             '/' +
//             _username.substring(8, 12) +
//             '-' +
//             _username.substring(12);
//       } catch (e) {
//         _username = '00.000.000/0000-00';
//       }
//     }

//     return Stack(
//       children: [
//         Padding(
//           padding: EdgeInsets.fromLTRB(26, 12, 26, 0),
//           child: Column(
//             children: <Widget>[
//               Center(
//                 child: Container(
//                   height: 150,
//                   width: 150,
//                   child: CircleAvatar(
//                     child: Center(
//                       child: Text(
//                         _initial,
//                         style: TextStyle(
//                             fontSize: 60,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white),
//                       ),
//                     ),
//                     backgroundColor: Global.appConfig.primaryColor,
//                   ),
//                 ),
//               ),
//               Container(
//                 // alignment: Alignment.topLeft,
//                 width: MediaQuery.of(context).size.width,
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             "Dados pessoais ",
//                             style: TextStyle(
//                                 fontSize: 14.0,
//                                 fontWeight: FontWeight.w500,
//                                 color: Theme.of(context).primaryColor),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Text(
//                         'Dono do cartão ',
//                         style: TextStyle(fontSize: 16.0),
//                       ),
//                       SizedBox(
//                         height: 4,
//                       ),
//                       Text(
//                         _fullName,
//                         style: TextStyle(
//                           fontSize: 14.0,
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Text(
//                         _personType == 'F' ? 'CPF' : 'CNPJ',
//                         style: TextStyle(fontSize: 16.0),
//                       ),
//                       SizedBox(
//                         height: 4,
//                       ),
//                       Row(
//                         children: <Widget>[
//                           Flexible(
//                             child: Text(
//                               _username,
//                               style: TextStyle(
//                                 fontSize: 14.0,
//                                 color: Colors.grey[600],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Positioned(
//           bottom: 0,
//           child: _loading
//               ? Container(
//                   width: MediaQuery.of(context).size.width,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         height: 34,
//                         width: 34,
//                         child: CircularProgressIndicator(),
//                       ),
//                       SizedBox(
//                         height: 28,
//                       ),
//                     ],
//                   ),
//                 )
//               : Container(
//                   alignment: Alignment.bottomCenter,
//                   width: MediaQuery.of(context).size.width,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Container(
//                         height: 50,
//                         width: MediaQuery.of(context).size.width - 40,
//                         child: RaisedButton(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(4),
//                           ),
//                           color: Theme.of(context).primaryColor,
//                           textColor: Colors.white,
//                           onPressed: () {
//                             _share(_authProvider);
//                           },
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "COMPARTILHAR",
//                                 style: TextStyle(
//                                   fontSize: 14.0,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 28,
//                       ),
//                     ],
//                   ),
//                 ),
//         ),
//       ],
//     );
//   }


//   @override
//   Widget build(BuildContext context) {
//     String _initial = '';
//     String _fullName = '';

//     try {
//       _initial = widget._account?.fullName?.substring(0, 1) ?? '';
//     } catch (e) {
//       _initial = '';
//     }

//     _fullName = widget._account?.fullName ?? 'Nome Completo';

//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
//     return Container(
//       color: Colors.grey[50],
//       child: SafeArea(
//         child: Scaffold(
//           key: _scaffoldKey,
//           appBar: AppBar(
//             elevation: 0,
//             backgroundColor: Colors.grey[50],
//             title: Text(
//               'Detalhes',
//               style:
//                   TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
//             ),
//             leading: IconButton(
//               icon:
//                   Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
//               onPressed: () => Navigator.of(context).pop(),
//             ),
//           ),
//           body: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.fromLTRB(20, 4, 20, 0),
//               child: Column(
//                 children: <Widget>[
//                   SizedBox(
//                     height: 4,
//                   ),
//                   Center(
//                     child: Container(
//                       height: 150,
//                       width: 150,
//                       child: CircleAvatar(
//                         child: Center(
//                           child: Text(
//                             _initial,
//                             style: TextStyle(
//                                 fontSize: 60,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                           ),
//                         ),
//                         backgroundColor: Global.appConfig.primaryColor,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   SizedBox(
//                     height: 14,
//                   ),
//                   Text(
//                     _fullName,
//                     style: TextStyle(
//                         fontSize: 17,
//                         color: Colors.black,
//                         fontWeight: FontWeight.w500),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
