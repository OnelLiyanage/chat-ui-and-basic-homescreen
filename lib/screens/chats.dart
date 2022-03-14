import 'package:chat_ui/helper/authenticate.dart';
import 'package:chat_ui/screens/chatinterface.dart';
import 'package:chat_ui/services/authentication.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
	@override
	_ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {

	// AuthMethods authMethods = new AuthMethods();

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar (
				title: Image.asset("assets/images/Logo-draft-clear-2.png",
				height: 50,
				),
				actions: [
					GestureDetector(
						onTap: () {
							// authMethods.signOut();
							Navigator.pushReplacement(context, MaterialPageRoute(
							builder: (context) => Authenticate() 
							));
						},
						child: Container (
							padding: EdgeInsets.symmetric(horizontal: 20.0),
							child: Icon(Icons.logout),
						),
					),
				],
			),
			body: Column(
				mainAxisSize: MainAxisSize.max,
				mainAxisAlignment: MainAxisAlignment.spaceEvenly,
				crossAxisAlignment: CrossAxisAlignment.center,
				children: [
					GestureDetector(
										onTap: () {
											Navigator.push(context, MaterialPageRoute(
				   							builder: (context) => MyHomePage()
											));
										},
										  child: Center(
											  child: Text(
												  "Scan for Melanoma",
												  style : TextStyle (
													  fontSize: 18.0,
													  color : Colors.black,
												  ),
											  ),
										  ),
										),
					Text(
						"Option 2",
						style : TextStyle (
							fontSize: 18.0,
							color : Colors.black,
						),
					),
					Text(
						"Option 3",
						style : TextStyle (
							fontSize: 18.0,
							color : Colors.black,
						),
					),Text(
						"Option 4",
						style : TextStyle (
							fontSize: 18.0,
							color : Colors.black,
						),
					)
				],
			),
		);
	}
}