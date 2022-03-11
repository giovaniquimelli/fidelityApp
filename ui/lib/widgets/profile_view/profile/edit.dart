import 'package:core/core.dart';
import 'package:core/dto/account_quick_registerDTO.dart';
import 'package:core/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class EditView extends StatefulWidget {
  final String _variable;
  final String _initialValue;
  final bool isPassword;
  final bool isfullName;
  final bool islegalName;
  final bool isEmail;
  final bool isMobilePhone;

  const EditView(
    this._variable,
    this._initialValue, {
    Key key,
    this.isPassword = false,
    this.isfullName = false,
    this.islegalName = false,
    this.isEmail = false,
    this.isMobilePhone = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EditViewState();
  }
}

class _EditViewState extends State<EditView> {
  bool _loading = false;

  static GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _textController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _legalNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobilePhoneController = TextEditingController();

  final FocusScopeNode _node = FocusScopeNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _changed = false;
  // final Map<String, dynamic> _formData = {
  //   'password': '',
  //   'fullName': '',
  //   'legalName': '',
  //   'email': '',
  //   'mobilePhone': '',
  // };

  AccountQuickRegistrationDTO _editedAccount =
      new AccountQuickRegistrationDTO();

  @override
  void initState() {
    super.initState();
    _fullNameController.text = widget._initialValue;
    _legalNameController.text = widget._initialValue;
    _emailController.text = widget._initialValue;
    _mobilePhoneController.text = widget._initialValue;

    Global.service.aciveScaffoldKey = _scaffoldKey;

    _editedAccount.email = '';
    _editedAccount.fullName = '';
    _editedAccount.legalName = '';
    _editedAccount.password = '';
    _editedAccount.mobilePhone = '';

    _editedAccount.personType = '';
    _editedAccount.account = '';
    _editedAccount.username = '';
  }

  @override
  void dispose() {
    _node.dispose();

    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    _fullNameController.dispose();
    _legalNameController.dispose();
    _emailController.dispose();
    _mobilePhoneController.dispose();

    super.dispose();
  }

  Widget _buildPasswordField() {
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
          labelText: 'Nova senha',
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
        _editedAccount.password = value;
      },
      onChanged: (String value) {
        setState(() {
          _editedAccount.password = value;
        });
      },
      onEditingComplete: () {
        _node.nextFocus();
      },
    );
  }

  Widget _buildPasswordConfirmationField() {
    return TextFormField(
      controller: _passwordConfirmationController,
      decoration: InputDecoration(

          // suffixIcon: IconButton(
          //   icon: Icon(Icons.remove_red_eye),
          //   onPressed: () {
          //     setState(() {
          //       _obscurePasswordText = !_obscurePasswordText;
          //     });
          //   },
          // ),
          labelText: 'Confirmar senha',
          filled: true,
          fillColor: Colors.grey[50]),
      obscureText: true,
      validator: (String value) {
        if (value.isEmpty || value != _editedAccount.password) {
          return 'Senha diferente';
        }
        return null;
      },
      onChanged: (String value) {
        setState(() {
          _changed = true;
        });
      },
      onEditingComplete: () {
        setState(() {
          _changed = true;
        });
        _formKey.currentState.validate();
        _node.unfocus();
      },
    );
  }

  Widget _buildFullNameField() {
    return TextFormField(
      controller: _fullNameController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          labelText: widget._variable,
          filled: true,
          fillColor: Colors.grey[50],
          labelStyle: TextStyle(
            color: Colors.grey[600],
          )),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Campo vazio';
        }
        return null;
      },
      onSaved: (String value) {
        _editedAccount.fullName = value;
      },
      onEditingComplete: _node.nextFocus,
      onChanged: (_) {
        setState(() {
          _changed = true;
        });
      },
    );
  }

  Widget _buildLegalNameField() {
    return TextFormField(
      controller: _legalNameController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          labelText: widget._variable,
          filled: true,
          fillColor: Colors.grey[50],
          labelStyle: TextStyle(
            color: Colors.grey[600],
          )),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Campo vazio';
        }
        return null;
      },
      onSaved: (String value) {
        _editedAccount.legalName = value;
      },
      onEditingComplete: _node.nextFocus,
      onChanged: (_) {
        setState(() {
          _changed = true;
        });
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: widget._variable,
          filled: true,
          fillColor: Colors.grey[50],
          labelStyle: TextStyle(
            color: Colors.grey[600],
          )),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Campo vazio';
        }
        return null;
      },
      onSaved: (String value) {
        _editedAccount.email = value;
      },
      onEditingComplete: _node.nextFocus,
      onChanged: (_) {
        setState(() {
          _changed = true;
        });
      },
    );
  }

  Widget _buildMobilePhoneField() {
    return TextFormField(
      controller: _mobilePhoneController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          labelText: widget._variable,
          filled: true,
          fillColor: Colors.grey[50],
          labelStyle: TextStyle(
            color: Colors.grey[600],
          )),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Campo vazio';
        }
        return null;
      },
      onSaved: (String value) {
        _editedAccount.mobilePhone = value;
      },
      onEditingComplete: _node.nextFocus,
      onChanged: (_) {
        setState(() {
          _changed = true;
        });
      },
    );
  }

  void _submitForm(AuthProvider _authProvider) async {
    bool _providerLoading = _authProvider?.isLoading ?? true;

    if (!_changed) {
      return;
    }

    if (_loading) {
      return;
    }
    if (_providerLoading) {
      showSnackBar('Tente novamente');
      return;
    }

    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    bool success;

    setState(() {
      _loading = true;
    });
    // Send form Data to try register and receive success or error message
    success = await Provider.of<AuthProvider>(context, listen: false)
        .editAccount(_editedAccount
            // password: _formData['password'],
            // fullName: _formData['fullName'],
            // legalName: _formData['legalName'],
            // email: _formData['email'],
            // mobilePhone: _formData['mobilePhone'],
            // username: '',
            // personType: '',
            );

    if (success) {
      setState(() {
        _loading = false;
      });
      Navigator.maybePop(context);
      showSnackBar('Conta atualizada com sucesso!');
    }

    // Navigator.pushReplacementNamed(context, '/auth_view');
    // Navigator.popUntil(context, ModalRoute.withName('/auth_view'));
  }

  Widget _formColumn(double targetWidth) {
    if (widget.isPassword) {
      return Column(
        children: [
          Container(
            width: targetWidth,
            child: _buildPasswordField(),
          ),
          SizedBox(
            height: 18.0,
          ),
          Container(
            width: targetWidth,
            child: _buildPasswordConfirmationField(),
          ),
          SizedBox(
            height: 36.0,
          ),
        ],
      );
    } else if (widget.isfullName) {
      return Column(
        children: [
          Container(
            width: targetWidth,
            child: _buildFullNameField(),
          ),
          SizedBox(
            height: 36.0,
          ),
        ],
      );
    } else if (widget.islegalName) {
      return Column(
        children: [
          Container(
            width: targetWidth,
            child: _buildLegalNameField(),
          ),
          SizedBox(
            height: 36.0,
          ),
        ],
      );
    } else if (widget.isEmail) {
      return Column(
        children: [
          Container(
            width: targetWidth,
            child: _buildEmailField(),
          ),
          SizedBox(
            height: 36.0,
          ),
        ],
      );
    } else if (widget.isMobilePhone) {
      return Column(
        children: [
          Container(
            width: targetWidth,
            child: _buildMobilePhoneField(),
          ),
          SizedBox(
            height: 36.0,
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    final _authProvider = Provider.of<AuthProvider>(context, listen: true);

    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.85;

    return WillPopScope(
      onWillPop: () async {
        if (_authProvider.isLoading) {
          return false;
        }
        return true;
      },
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey[50],
          title: Text(
            widget._variable,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              if (_loading) {
                return;
              }
              Navigator.maybePop(context);
            },
          ),
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 26),
                    width: deviceWidth,
                    child: Form(
                      key: _formKey,
                      child: FocusScope(
                        node: _node,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            _formColumn(targetWidth),
                            Container(
                              height: 48,
                              width: targetWidth,
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                color: _changed
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey[100],
                                textColor: Colors.black,
                                onPressed: () {
                                  setState(() {
                                    _submitForm(_authProvider);
                                  });
                                },
                                child: Text(
                                  _loading ? "Aguarde..." : "Save",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: _changed
                                        ? Colors.white
                                        : Colors.grey[600],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
