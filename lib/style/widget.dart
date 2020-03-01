import 'color.dart';
import 'package:flutter/material.dart';

// Text Style
TextStyle stylePrimaryHeader = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.bold,
  color: colorHeader,
);

TextStyle styleSecondaryHeader = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: colorHeader,
);

TextStyle styleItemCardTitle = TextStyle(
  fontSize: 20,
  color: colorText
);

TextStyle styleItemCardSubTitle = TextStyle(
  fontSize: 12,
  color: colorText
);

TextStyle styleNoData = TextStyle(
  fontSize: 20,
  color: colorSubText
);

TextStyle styleInputField = TextStyle(
  color: Colors.black87, 
  fontSize: 16.0
  );


//border
OutlineInputBorder outlineInputBorder = 
OutlineInputBorder(
  borderRadius:BorderRadius.circular(5.0),
    borderSide: BorderSide(color: Colors.amber[600], width: 1.0,)
);

