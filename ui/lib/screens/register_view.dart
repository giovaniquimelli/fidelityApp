import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RegisterViewState();
  }
}

class _RegisterViewState extends State<RegisterView> {
  static GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _legalNameController = TextEditingController();
  final TextEditingController _cpfCnpjController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobilePhoneController = TextEditingController();

  final FocusScopeNode _node = FocusScopeNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {
    'username': '',
    'password': '',
    'fullName': '',
    'legalName': '',
    'email': '',
    'mobilePhone': '',
    'personType': ''
  };
  var _isLoading = false;
  var _obscurePasswordText = true;

  final keyIsFirstLoaded = 'is_first_loaded';

  int _radioValue1 = 0;

  @override
  void initState() {
    super.initState();

    Global.service.aciveScaffoldKey = _scaffoldKey;
  }

  @override
  void dispose() {
    _node.dispose();
    _loginController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    _legalNameController.dispose();
    _cpfCnpjController.dispose();
    _emailController.dispose();

    super.dispose();
  }

  Widget _buildCpfField(double targetWidth) {
    final maskCpf = MaskTextInputFormatter(
        mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});

    return Column(
      children: [
        Container(
          width: targetWidth,
          child: TextFormField(
            keyboardType: TextInputType.text,
            controller: _nameController,
            decoration: InputDecoration(
                labelText: 'Name', filled: true, fillColor: Colors.grey[50]),
            obscureText: false,
            validator: (String value) {
              if (value.isEmpty) {
                return 'Nome Inválido';
              }
              return null;
            },
            onSaved: (String value) {
              _formData['fullName'] = value;
              _formData['legalName'] = '';
              _formData['personType'] = 'F';
              print(_formData['personType']);
            },
            onEditingComplete: _node.nextFocus,
          ),
        ),
        SizedBox(
          height: 14.0,
        ),
        Container(
          width: targetWidth,
          child: TextFormField(
            inputFormatters: [maskCpf],
            keyboardType: TextInputType.datetime,
            controller: _cpfCnpjController,
            decoration: InputDecoration(
                labelText: 'CPF', filled: true, fillColor: Colors.grey[50]),
            obscureText: false,
            validator: (String value) {
              if (value.isEmpty) {
                return 'CPF Inválido';
              }
              return null;
            },
            onSaved: (String value) {
              String _unmaskedCpf = '';

              _unmaskedCpf = value.substring(0, 3) +
                  value.substring(4, 7) +
                  value.substring(8, 11) +
                  value.substring(12);

              _formData['username'] = _unmaskedCpf;
            },
            onEditingComplete: _node.nextFocus,
          ),
        ),
      ],
    );
  }

  Widget _buildCnpjField(double targetWidth) {
    final maskCNPJ = MaskTextInputFormatter(
        mask: "##.###.###/####-##", filter: {"#": RegExp(r'[0-9]')});

    return Column(
      children: [
        Container(
          width: targetWidth,
          child: TextFormField(
            keyboardType: TextInputType.text,
            controller: _nameController,
            decoration: InputDecoration(
                labelText: 'Nome', filled: true, fillColor: Colors.grey[50]),
            obscureText: false,
            validator: (String value) {
              if (value.isEmpty) {
                return 'Nome Inválido';
              }
              return null;
            },
            onSaved: (String value) {
              _formData['fullName'] = value;
            },
            onEditingComplete: _node.nextFocus,
          ),
        ),
        SizedBox(
          height: 14.0,
        ),
        Container(
          width: targetWidth,
          child: TextFormField(
            keyboardType: TextInputType.text,
            controller: _legalNameController,
            decoration: InputDecoration(
                labelText: 'Razão social',
                filled: true,
                fillColor: Colors.grey[50]),
            obscureText: false,
            validator: (String value) {
              if (value.isEmpty) {
                return 'Razão social inválida';
              }
              return null;
            },
            onSaved: (String value) {
              _formData['legalName'] = value;
              _formData['personType'] = 'J';
            },
            onEditingComplete: _node.nextFocus,
          ),
        ),
        SizedBox(
          height: 14.0,
        ),
        Container(
          width: targetWidth,
          child: TextFormField(
            inputFormatters: [maskCNPJ],
            keyboardType: TextInputType.datetime,
            controller: _cpfCnpjController,
            decoration: InputDecoration(
                labelText: 'CNPJ', filled: true, fillColor: Colors.grey[50]),
            obscureText: false,
            validator: (String value) {
              if (value.isEmpty) {
                return 'CNPJ Inválido';
              }
              return null;
            },
            onSaved: (String value) {
              String _unmaskedCnpj = '';

              _unmaskedCnpj = value.substring(0, 2) +
                  value.substring(3, 6) +
                  value.substring(7, 10) +
                  value.substring(11, 15) +
                  value.substring(16);

              _formData['username'] = _unmaskedCnpj;
            },
            onEditingComplete: _node.nextFocus,
          ),
        ),
      ],
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: _emailController,
      decoration: InputDecoration(
          // suffixIcon: IconButton(
          //   icon: Icon(Icons.remove_red_eye),
          //   onPressed: () {
          //     setState(() {
          //       _obscurePasswordText = !_obscurePasswordText;
          //     });
          //   },
          // ),
          labelText: 'E-mail',
          filled: true,
          fillColor: Colors.grey[50]),
      validator: (String value) {
        if (value.isEmpty || value.length < 7) {
          return 'e-mail Inválido';
        }
        return null;
      },
      onSaved: (String value) {
        _formData['email'] = value;
      },
      onEditingComplete: () {
        _node.nextFocus();
      },
    );
  }

  Widget _buildMobilePhoneTextField() {
    final maskPhone = MaskTextInputFormatter(
        mask: "(##) # ####-####", filter: {"#": RegExp(r'[0-9]')});
    return TextFormField(
      inputFormatters: [maskPhone],
      keyboardType: TextInputType.phone,
      controller: _mobilePhoneController,
      decoration: InputDecoration(
          // suffixIcon: IconButton(
          //   icon: Icon(Icons.remove_red_eye),
          //   onPressed: () {
          //     setState(() {
          //       _obscurePasswordText = !_obscurePasswordText;
          //     });
          //   },
          // ),
          labelText: 'Phone',
          filled: true,
          fillColor: Colors.grey[50]),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Celular inválido';
        }
        return null;
      },
      onSaved: (String value) {
        _formData['mobilePhone'] = value;
      },
      onEditingComplete: () {
        _node.nextFocus();
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      controller: _passwordController,
      decoration: InputDecoration(
          // suffixIcon: IconButton(
          //   icon: Icon(Icons.remove_red_eye),
          //   onPressed: () {
          //     setState(() {
          //       _obscurePasswordText = !_obscurePasswordText;
          //     });
          //   },
          // ),
          labelText: 'Password',
          filled: true,
          fillColor: Colors.grey[50]),
      obscureText: true,
      validator: (String value) {
        if (value.isEmpty || value.length < 3) {
          return 'Senha Inválida';
        }
        return null;
      },
      onSaved: (String value) {
        _formData['password'] = value;
      },
      onChanged: (String value) {
        setState(() {
          _formData['password'] = value;
        });
      },
      onEditingComplete: () {
        _node.nextFocus();
      },
    );
  }

  Widget _buildConfirmPasswordTextField() {
    return TextFormField(
        controller: _confirmPasswordController,
        decoration: InputDecoration(

            // suffixIcon: IconButton(
            //   icon: Icon(Icons.remove_red_eye),
            //   onPressed: () {
            //     setState(() {
            //       _obscurePasswordText = !_obscurePasswordText;
            //     });
            //   },
            // ),
            labelText: 'Confirm password',
            filled: true,
            fillColor: Colors.grey[50]),
        obscureText: true,
        validator: (String value) {
          if (value.isEmpty || value != _formData['password']) {
            return 'Senha diferente';
          }
          return null;
        },
        onEditingComplete: () {
          _formKey.currentState.validate();
          _node.unfocus();
        });
  }

  Widget _buildPersonTypeRadioButtons(double deviceWidth) {
    return Container(
      width: deviceWidth - 12,
      child: new Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio(
                value: 0,
                groupValue: _radioValue1,
                onChanged: (i) => {
                  setState(() {
                    _radioValue1 = i;
                  }),
                },
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  setState(() {
                    _radioValue1 = 0;
                  });
                },
                child: new Text(
                  'Person',
                  style: new TextStyle(fontSize: 14.0),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              new Radio(
                value: 1,
                groupValue: _radioValue1,
                onChanged: (i) => {
                  setState(() {
                    _radioValue1 = i;
                  }),
                },
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  setState(() {
                    _radioValue1 = 1;
                  });
                },
                child: new Text(
                  'Company',
                  style: new TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _submitForm() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    Map<String, dynamic> successInformation;

    // Send form Data to try register and receive success or error message
    setState(() {
      _isLoading = true;
    });

    successInformation =
        await Provider.of<AuthProvider>(context, listen: false).register(
      username: _formData['username'],
      password: _formData['password'],
      fullName: _formData['fullName'],
      legalName: _formData['legalName'],
      email: _formData['email'],
      personType: _formData['personType'],
      mobilePhone: _formData['mobilePhone'],
    );

    if (successInformation['success']) {
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Ocorreu um erro!'),
            content: Text(successInformation['message']),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    }
    setState(() {
      _isLoading = false;
    });

    // Navigator.pushReplacementNamed(context, '/auth_view');
    // Navigator.popUntil(context, ModalRoute.withName('/auth_view'));
    Navigator.maybePop(context);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth - 40;
    // TODO if iOS show permission dialog
    // Future.delayed(Duration.zero, () => _showPushPermissionDialog());
    // sendPlayerIdToServer();
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Container(
        color: Colors.grey[50],
        child: SafeArea(
          child: Stack(
            children: [
              Scaffold(
                key: _scaffoldKey,
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.grey[50],
                  title: Text(
                    'Sign up',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w400),
                  ),
                  leading: IconButton(
                      icon: Icon(Icons.arrow_back,
                          color: Theme.of(context).primaryColor),
                      onPressed: () {
                        if (_isLoading) {
                          return;
                        }
                        Navigator.maybePop(context);
                      }),
                ),
                resizeToAvoidBottomInset: true,
                // backgroundColor: Colors.white,
                body: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        width: deviceWidth,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            Form(
                              key: _formKey,
                              child: FocusScope(
                                node: _node,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    _buildPersonTypeRadioButtons(deviceWidth),
                                    _radioValue1 == 0
                                        ? _buildCpfField(targetWidth)
                                        : _buildCnpjField(targetWidth),
                                    SizedBox(
                                      height: 14.0,
                                    ),
                                    Container(
                                      width: targetWidth,
                                      child: _buildEmailTextField(),
                                    ),
                                    SizedBox(
                                      height: 14.0,
                                    ),
                                    Container(
                                      width: targetWidth,
                                      child: _buildMobilePhoneTextField(),
                                    ),
                                    SizedBox(
                                      height: 14.0,
                                    ),
                                    Container(
                                      width: targetWidth,
                                      child: _buildPasswordTextField(),
                                    ),
                                    SizedBox(
                                      height: 14.0,
                                    ),
                                    Container(
                                      width: targetWidth,
                                      child: _buildConfirmPasswordTextField(),
                                    ),
                                    SizedBox(
                                      height: 120.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Container(
                            //   padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            //   width: MediaQuery.of(context).size.width - 40,
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //     mainAxisAlignment: MainAxisAlignment.end,
                            //     children: [
                            //       Container(
                            //         height: 50,
                            //         child: RaisedButton(
                            //           shape: RoundedRectangleBorder(
                            //             borderRadius: BorderRadius.circular(4),
                            //           ),
                            //           color: Theme.of(context).primaryColor,
                            //           textColor: Colors.white,
                            //           onPressed: () {
                            //             Navigator.maybePop(context);
                            //           },
                            //           child: Row(
                            //             mainAxisSize: MainAxisSize.max,
                            //             mainAxisAlignment: MainAxisAlignment.center,
                            //             children: [
                            //               Text(
                            //                 "CADASTRAR",
                            //                 style: TextStyle(
                            //                   fontSize: 14.0,
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //       SizedBox(
                            //         height: 28,
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.bottomCenter,
                    //   child: Container(
                    //     width: MediaQuery.of(context).size.width - 40,
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       mainAxisAlignment: MainAxisAlignment.end,
                    //       children: [
                    //         Container(
                    //           height: 50,
                    //           child: RaisedButton(
                    //             shape: RoundedRectangleBorder(
                    //               borderRadius: BorderRadius.circular(4),
                    //             ),
                    //             color: Theme.of(context).primaryColor,
                    //             textColor: Colors.white,
                    //             onPressed: () {
                    //               Navigator.maybePop(context);
                    //             },
                    //             child: Row(
                    //               mainAxisSize: MainAxisSize.max,
                    //               mainAxisAlignment: MainAxisAlignment.center,
                    //               children: [
                    //                 Text(
                    //                   "CADASTRAR",
                    //                   style: TextStyle(
                    //                     fontSize: 14.0,
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           height: 28,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 40,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: () {
                            _submitForm();
                            // Navigator.maybePop(context);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _isLoading ? "AGUARDE..." : "SIGN UP",
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
