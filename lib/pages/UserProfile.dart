import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final List<String> _listItem = [
    'assets/download1.jpeg',
    'assets/download2.jpeg',
    'assets/download3.jpeg',
    'assets/download1.jpeg',
    'assets/download2.jpeg',
    'assets/download3.jpeg',
    'assets/download1.jpeg',
    'assets/download2.jpeg',
    'assets/download3.jpeg',
    'assets/download1.jpeg',
    'assets/download2.jpeg',
    'assets/download3.jpeg',
    'assets/download1.jpeg',
    'assets/download2.jpeg',
    'assets/download3.jpeg',
  ];

  var _textstyle = TextStyle(fontFamily: 'Pacifico', fontSize: 15.0);
  var _sizeHeight = SizedBox(
    height: 15.0,
  );
  @override
  build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios),
          elevation: 0.0,
        ),
        body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: LayoutBuilder(builder: (context, Constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _Userpic(),
              _sizeHeight,
              _username(),
              _sizeHeight,
              _useraction(),
              _sizeHeight,
              _usermanagebar(),
              _sizeHeight,
              _postList()
            ],
          );
        }),
      ),
    );
  }
 
  _Userpic() {
     return SafeArea(
     child: Container(
       width: 116.0,
       height: 119.0,
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        image: new DecorationImage(image: new AssetImage('assets/userimage.png'),
          fit: BoxFit.cover

        )
      ),
     ),
     );
  }

  _username() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Text(
            'User Name',
            style: TextStyle(
                fontFamily: 'Pacifico',
                //fontWeight: FontWeight.bold,
                fontSize: 25.0),
          ),
          Text('@tagname'),
        ],
      ),
    );
  }

  _useraction() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(icon: Icon(FontAwesomeIcons.paperPlane), onPressed: () {}),

          OutlineButton(
            shape: StadiumBorder(),
            textColor: Colors.black,
            child: Text('Follow',style: TextStyle(fontFamily: 'Pacifico'),),
            borderSide: BorderSide(
                color: Colors.black, style: BorderStyle.solid,
                width: 1),
            onPressed: () {},
          ),
          /*MaterialButton(

            //elevation: 2.0,
            onPressed: () {},
            child: Center(
              child: Text(
                'Follow',
                style: TextStyle(

                    fontFamily: 'Pacifico',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),*/
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
      ),
    );
  }

  _usermanagebar() {
    return Container(
      color: Color.fromARGB(60, 233, 233, 233),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                '36',
                style: _textstyle,
              ),
              Text(
                'Post',
                style: _textstyle,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '588k',
                style: _textstyle,
              ),
              Text(
                'Folllowers',
                style: _textstyle,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '96',
                style: _textstyle,
              ),
              Text(
                'Followings',
                style: _textstyle,
              ),
            ],
          ),
        ],
      ),
    );
  }

  _postList() {
    return Expanded(
        child: GridView.count(
            crossAxisCount: 3,
            padding: EdgeInsets.all(20),
            crossAxisSpacing: 0.01,
            mainAxisSpacing: 0.01,
            children: _listItem
                .map((item) => Card(
                      semanticContainer: true,
                      color: Colors.white,
                      child: Container(


                        //height: 202,
                        //width: 121,
                        decoration: BoxDecoration(

                            image: DecorationImage(
                                image: AssetImage(item), fit: BoxFit.cover)),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.transparent),
                              child: Icon(Icons.play_arrow),
                                                          
                            ),
                            Container(

                              margin: EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.transparent),
                              child: Text('559k',style: TextStyle(fontFamily: 'Pacifico'),),)
                          ],
                        ),
                        
                      ),
                    ))
                .toList())

        /* GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2.0,
        childAspectRatio: 10 / 1,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: List.generate(
          20,
          (index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/jacok.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
              ),
            );
          },
        ),
      ),*/
        );
  }
}
