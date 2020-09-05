import 'package:TikTokUI/screens/Signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login> {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 15.0,
                  ),
                  new Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "WELCOME BACK",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Login to your account"),
                        SizedBox(
                          height: 20.0,
                        ),
                        new TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(35),
                          ],
                          showCursor: true,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            border: OutlineInputBorder(),
                            labelText: "Email Or Phone No.",
                            hintMaxLines: 2,
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        new TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(8),
                          ],
                          showCursor: true,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            border: OutlineInputBorder(),
                            labelText: "Password",
                            hintMaxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(right: 18.0),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  new Container(
                    child: new MaterialButton(
                      onPressed: () {},
                      height: 50.0,
                      minWidth: 330,
                      color: myColorred,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        "Login",
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
                        Text("  Login in  with"),
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
                            height: 50.0,
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
                        Text("New Users!"),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => new Login()));
                          },
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => new Signin()));
                            },
                            child: Text(
                              " Signup",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17.0),
                            ),
                          ),
                        ),
                      ],
                    ),
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
