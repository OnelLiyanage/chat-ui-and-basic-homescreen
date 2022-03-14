import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';

class MyHomePage extends StatefulWidget {
	// MyHomePage({  Key? key,  required this.title }) : super(key: key);
	// final String title ;

	@override
	_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

	// void response(query) async {
	// 	AuthGoogle authGoogle = await AuthGoogle(
	// 			fileJson: "assets/dialogflow-chat.json"
	// 			) .build() ;
	// 	Dialogflow dialogflow = Dialogflow( authGoogle: authGoogle, language: Language.english);
	// 	AIResponse aiResponse = await dialogflow.detectIntent(query);
	// 	setState(() {
	// 		messages.insert(0, {
	// 			"data": 0,
	// 			"message": aiResponse.getListMessage()[0]["text"]["text"][0].toString()
	// 		});
	// 	});

	// 	print( aiResponse.getListMessage()[0]["text"]["text"][0].toString() );
		
	// }

	final messageInsert = TextEditingController();
	List<Map> messages = [ ];

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Center 
					(
                        child: Text ("Melano")
				    ),
			),

			body: Container ( 
				child: Column (
					children: <Widget> [
						
						Flexible(child: ListView.builder  (
							reverse:  true,
							itemCount: messages.length,
							itemBuilder: (context, index) => chat (
								messages[index] ["message"].toString(),
								messages[index] ["data"]
							)
						)
						),

						SizedBox( height: 20.0 ),

						Divider( 
							height: 5.0,
						),

					Container(
						child: ListTile (

							title: Container (
								height: 35,
								decoration:  BoxDecoration (
									borderRadius: BorderRadius.all(Radius.circular(15)),
									color: Color.fromRGBO(220, 220, 220, 1),
								),

								padding: EdgeInsets.only(left: 15),
								child: TextFormField (
									controller: messageInsert,
									decoration: InputDecoration (
										hintText: "Ask your question here...",
										hintStyle: TextStyle (
											color:  Colors.black45
										),
										
										border:  InputBorder.none,
										focusedBorder: InputBorder.none,
										enabledBorder: InputBorder.none,
										errorBorder: InputBorder.none,
										disabledBorder: InputBorder.none,
									),

									style: TextStyle (
										fontSize: 15,
										color: Colors.black
									),

									onChanged: (value) { },

									),
								),

							// 	leading: IconButton ( 
								
							// ),

								trailing: IconButton (
									
									icon:  Icon(
										Icons.send,
										size: 30.0,
									),

									onPressed: () { 
										if (messageInsert.text.isEmpty) {
											print("Message is Empty");
										} else {
											setState(() {
											messages.insert(0,
													{ "data" : 1, "message" : messageInsert.text } );
											});

											// response(messageInsert.text);
											messageInsert.clear();
										}

										FocusScopeNode currentFocus = FocusScope.of(context);
										if ( !currentFocus.hasPrimaryFocus ) {
											currentFocus.unfocus();
										}
									}
								),
							),
						),

						SizedBox( height: 10.0 )

					],
				),
			),
		);
	}

	Widget chat (String message, int data) {
		return Container(
			padding: EdgeInsets.only(left: 10, right: 10),

			child: Row(
				mainAxisAlignment: data == 1 ? MainAxisAlignment.end : MainAxisAlignment.start,
				children: [
					data == 0 ? Container(
						height: 50.0,
						width: 50.0,
						child: CircleAvatar (
							backgroundImage: AssetImage ("assets/images/Logo-draft-clear-2.png"),
						),
					) : Container(),

					Padding (
						padding: EdgeInsets.all(5.0),
						child: Bubble (
							radius: Radius.circular(5.0),
							color: data==0 ? Color.fromRGBO(23, 157, 139, 1) : Colors.blue.shade200,
							elevation: 0.0,

							child:  Padding (
								padding: EdgeInsets.all(2.0),
								child: Row(
									mainAxisSize: MainAxisSize.min,
									children: <Widget> [
										SizedBox( width: 10.0 ),

										Flexible(
											child: Container (
												constraints: BoxConstraints (maxWidth: 200),
												child: Text (
													message,
													style: TextStyle (
														color: Colors.white,
														fontWeight: FontWeight.bold,
													),
												),
											)
										)
									],
								),
							)
						),
					),

					data == 1 ? Container (
						// height: 60.0,
						// width: 60.0,
						// child: CircleAvatar (
						// 	backgroundImage: AssetImage("assets/default.jpg"),
						// 	),
					) : Container() ,

				],
			),
			
		);
	}
}
