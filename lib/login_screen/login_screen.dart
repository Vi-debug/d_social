import 'package:d_social/login_screen/bloc/login_bloc.dart';
import 'package:d_social/newsfeed_screen/newsfeed_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();

  final _passwordsController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _blocLogin = LoginBloc();

  bool _isShowLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => _blocLogin,
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              _isShowLoading = false;
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => NewsfeedScreen(),
                ),
              );
            } else if (state is LoginFailure) {
              _isShowLoading = false;
            } else if (state is LoadingState) {
              _isShowLoading = true;
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                Container(
                  height: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('D social'),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _usernameController,
                                validator: (value) {
                                  if (value == "" || value == null)
                                    return 'Please enter username';
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'username',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(width: 2),
                                  ),
                                ),
                              ),
                              TextFormField(
                                controller: _passwordsController,
                                decoration: InputDecoration(
                                  hintText: 'password',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(width: 2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        RaisedButton(
                          color: Colors.red.shade400,
                          onPressed: () {
                            signIn(context);
                          },
                          child: Text('Sign In'),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Visibility(
                      visible: _isShowLoading,
                      child: CupertinoActivityIndicator()),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> signIn(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _blocLogin.add(LoadingEvent());
      _blocLogin.add(
          LoginUserEvent(_usernameController.text, _passwordsController.text));
    }
  }

  @override
  void dispose() {
    _blocLogin.close();
    super.dispose();
  }
}
