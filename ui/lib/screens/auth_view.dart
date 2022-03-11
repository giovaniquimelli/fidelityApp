import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AuthViewState();
  }
}

class _AuthViewState extends State<AuthView> {
  static GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusScopeNode _node = FocusScopeNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {'username': null, 'password': null};
  bool _isLoading = false;
  final keyIsFirstLoaded = 'is_first_loaded';

  String _authPassword = '';

  var _obscurePasswordText = true;

  @override
  void initState() {
    super.initState();

    Global.service.aciveScaffoldKey = _scaffoldKey;
  }

    @override
  void didChangeDependencies() {
    _authPassword = Provider.of<AuthProvider>(context, listen: true).authPassword;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _node.dispose();
    _loginController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  Widget _buildLoginTextField() {
    return TextFormField(
      controller: _loginController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          labelText: 'CPF/CNPJ', filled: true, fillColor: Colors.grey[50]),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Login inválido';
        }
        return null;
      },
      onSaved: (String value) {
        _formData['username'] = value;
      },
      onEditingComplete: _node.nextFocus,
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      controller: _passwordController,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            splashColor: Colors.transparent,
            icon: Icon(
              Icons.remove_red_eye,
              color: _obscurePasswordText
                  ? Colors.grey[600]
                  : Global.appConfig.primaryColor,
            ),
            onPressed: () {
              setState(() {
                _obscurePasswordText = !_obscurePasswordText;
              });
            },
          ),
          labelText: 'Password',
          // labelText: _authPassword ?? "",
          filled: true,
          fillColor: Colors.grey[50]),
      obscureText: _obscurePasswordText,
      validator: (String value) {
        if (value.isEmpty || value.length < 3) {
          return 'Senha Inválida';
        }
        return null;
      },
      onSaved: (String value) {
        _formData['password'] = value;
      },
      onEditingComplete: _node.unfocus,
    );
  }

  void _submitForm() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    Map<String, dynamic> successInformation;

    // Send form Data to try authentication and receive success or error message
    setState(() {
      _isLoading = true;
    });

    successInformation = await Provider.of<AuthProvider>(context, listen: false)
        .authenticate(
            username: _formData['username'], password: _formData['password']);

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
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.9;
    // TODO if iOS show permission dialog
    // Future.delayed(Duration.zero, () => _showPushPermissionDialog());
    // sendPlayerIdToServer();
    return Container(
      color: Colors.grey[50],
      child: SafeArea(
        child: Scaffold(
          // resizeToAvoidBottomPadding: false,
          key: _scaffoldKey,
          resizeToAvoidBottomInset: true,
          // backgroundColor: Colors.white,
          body: Center(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: SingleChildScrollView(
                child: Container(
                  // height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 260,
                      ),
                      Container(
                        // alignment: Alignment.center,
                        width: deviceWidth,
                        child: Form(
                          key: _formKey,
                          child: FocusScope(
                            node: _node,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: targetWidth,
                                  child: _buildLoginTextField(),
                                ),
                                SizedBox(
                                  height: 14.0,
                                ),
                                Container(
                                  width: targetWidth,
                                  child: _buildPasswordTextField(),
                                ),
                                SizedBox(
                                  height: 28.0,
                                ),
                                _isLoading
                                    ? Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: CircularProgressIndicator(),
                                      )
                                    : Container(
                                        width: targetWidth,
                                        child: FlatButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            padding: EdgeInsets.fromLTRB(
                                                26, 17, 26, 17),
                                            color:
                                                Theme.of(context).primaryColor,
                                            textColor: Colors.white,
                                            child: Row(
                                              // mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Sign in',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            onPressed: () {
                                              _submitForm();
                                              // Provider.of<AuthProvider>(context,
                                              // listen: false)
                                              // .doLogin();
                                            }),
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Does not have an account?',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[800],
                                ),
                                textAlign: TextAlign.center,
                              ),
                              GestureDetector(
                                onTap: () =>
                                    Navigator.pushNamed(context, '/register')
                                        .then((_) {
                                  Global.service.aciveScaffoldKey =
                                      _scaffoldKey;
                                }),
                                behavior: HitTestBehavior.opaque,
                                child: Text(
                                  ' Sign up',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Global.appConfig.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
