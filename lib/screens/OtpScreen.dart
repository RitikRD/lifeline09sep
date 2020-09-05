import 'package:TikTokUI/pages/root_app.dart';
import 'package:TikTokUI/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    Color myColorred = Color(0xfffd0002);
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              height: screenheight,
              width: screenwidth,
              color: Colors.transparent),
          Container(
              height: screenheight - screenheight / 1.7,
              width: screenwidth,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/tiktok.jpg'),
                      fit: BoxFit.cover))),
          Positioned(
            top: screenheight - screenheight / 2.3 - 150.0,
            child: Container(
              padding: EdgeInsets.only(left: 20.0),
              height: screenheight / 3 + 400.0,
              width: screenwidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  new Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "CREATE ACCOUNT",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Text("Signup for account"),
                        SizedBox(
                          height: 30.0,
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(right: 18.0),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          child: TextField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                            ],
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.black)),
                                focusColor: Colors.white,
                                fillColor: Colors.white,
                                border: OutlineInputBorder()),
                            keyboardType: TextInputType.number,
                          ),
                          height: 70.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[50],
                                offset: Offset(0.0, 1.0),
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: TextField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                            ],
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.black)),
                                focusColor: Colors.white,
                                fillColor: Colors.white,
                                border: OutlineInputBorder()),
                            keyboardType: TextInputType.number,
                          ),
                          height: 70.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[50],
                                offset: Offset(0.0, 1.0),
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: TextField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                            ],
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.black)),
                                focusColor: Colors.white,
                                fillColor: Colors.white,
                                border: OutlineInputBorder()),
                            keyboardType: TextInputType.number,
                          ),
                          height: 70.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[50],
                                offset: Offset(0.0, 1.0),
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: TextField(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.black)),
                                focusColor: Colors.white,
                                fillColor: Colors.white,
                                border: OutlineInputBorder()),
                            keyboardType: TextInputType.number,
                          ),
                          height: 70.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[50],
                                offset: Offset(0.0, 1.0),
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.only(right: 20.0),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  new Container(
                    child: new MaterialButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => new RootApp()));
                      },
                      height: 50.0,
                      minWidth: 330,
                      disabledColor: myColorred,
                      color: myColorred,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0),
                      ),
                    ),
                    padding: new EdgeInsets.only(right: 18.0),
                  ),
                  SizedBox(height: 20.0),
                  new Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "OR",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22.0),
                        ),
                        Text(" Signup with"),
                      ],
                    ),
                    alignment: Alignment.center,
                    padding: new EdgeInsets.only(right: 28.0),
                  ),
                  SizedBox(height: 20.0),
                  new Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new FlatButton(
                          onPressed: () {},
                          child: Image(
                            image: AssetImage("assets/facebook.png"),
                            height: 50.0,
                            width: 50.0,
                          ),
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Image(
                            image: AssetImage("assets/google.png"),
                            height: 60.0,
                            width: 60.0,
                          ),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    padding: new EdgeInsets.only(right: 18.0),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Already have an account!"),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => new Login()));
                          },
                          child: Text(
                            " Login",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17.0),
                          ),
                        )
                      ],
                    ),
                    padding: new EdgeInsets.only(right: 20.0),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0))),
            ),
          ),
        ],
      ),
    );
  }
}
