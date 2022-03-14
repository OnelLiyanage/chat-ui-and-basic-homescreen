import 'package:chat_ui/widgets/widget.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

	final	Function toggle;
	SignIn(this.toggle);
	
	@override
	_SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

	@override
	Widget build(BuildContext context) {
		return Scaffold (
			appBar: AppBar (
				title: Image.asset("assets/images/Logo-draft-clear-2.png",
				height: 50,
				),
			),

			body: Container(
				alignment: Alignment.bottomCenter,
							child: Container(
								padding: EdgeInsets.symmetric(horizontal: 25.0),
									child: Column (
										mainAxisSize: MainAxisSize.min,
									children: [
										TextField(
											decoration: inputFeildDecoration ("Email"),
										),
									SizedBox(height: 20.0),

										TextField(
											decoration: inputFeildDecoration ("Password"),
										),
									SizedBox(height: 20.0),

										Container(
											child: Container ( 
												alignment: Alignment.centerRight,
												padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
												child: Text (
													"Forgot Password",
													style: TextStyle (
														fontSize: 14.0
													),
												),
											),
										),
										SizedBox( height: 15.0,),
										Container(
											alignment: Alignment.center,
											width: MediaQuery.of(context).size.width,
											padding: EdgeInsets.symmetric(vertical: 20),
											decoration: BoxDecoration(
												gradient: LinearGradient (
													colors:  [
														const Color(0xff007EF4),
														const Color(0xff2A75DA) 
														]
												),
												borderRadius: BorderRadius.circular(25)
											),
											child: Text (
												"Login",
												style: TextStyle (
													fontSize: 18.0,
													color: Colors.white,
												),
											),
										),
										SizedBox(height: 20.0),
										Row(
											mainAxisAlignment: MainAxisAlignment.center,
											children: [
												Text ("Dont have an account? "),
												GestureDetector (
													onTap: () {
														widget.toggle();
													},
													child: Container(
														padding: EdgeInsets.symmetric(vertical: 10.0),
													child: Text(
														" Sign Up here ",
														style: TextStyle (
															decoration: TextDecoration.underline
														),
														),
													),
												)
											],
										),
										SizedBox(height: 100.0),
									],
								),
							),
			),
		);
	}
}
