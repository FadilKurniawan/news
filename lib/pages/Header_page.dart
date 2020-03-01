import 'package:flutter/material.dart';
import 'package:news/style/styleImport.dart';

class HeaderPage extends StatefulWidget {
  HeaderPage({Key key}) : super(key: key);

  @override
  _HeaderPageState createState() => _HeaderPageState();
}

class _HeaderPageState extends State<HeaderPage> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          image: DecorationImage(
                image: AssetImage(Constant.resHeaderBackground),
                fit: BoxFit.cover,
          ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0)
        )
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height/20,),
          Padding(
            padding: EdgeInsets.only(left:MediaQuery.of(context).size.width/5),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                Constant.textSecondaryTitle,
                style: styleSecondaryHeader
              )
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              Constant.textPrimaryTitle,
              style: stylePrimaryHeader
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:20.0,bottom: 30),
          ),
        ],
      ),
    );
  }
}