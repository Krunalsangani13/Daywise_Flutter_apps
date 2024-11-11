import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output="0";
  String _expression="";

  double num1=0;
  double num2=0;
  String operand="";

  void _buttonPressed(String buttonText){
    if(buttonText=="C"){
      _expression="";
      num1=0;
      num2=0;
      operand="";
      _output="0";
    }else if(buttonText == "+" || buttonText=="-" || buttonText=="*" ||buttonText=="/"){
      num1=double.parse(_expression);
      operand=buttonText;
      _expression="";
    }else if(buttonText=="="){
      num2=double.parse(_expression);
      switch(operand){
        case "+":
          _output=(num1+num2).toString();
          break;
        case"-":
          _output=(num1-num2).toString();
          break;
        case"*":
          _output=(num1+num2).toString();
          break;
        case"/":
          _output=(num1/num2).toString();
          break;
      }
      _expression=_output;
      num1=0;
      num2=0;
      operand="";
    }else{
      _expression+=buttonText;
      _output=_expression;
    }

    setState(() {
      _output=double.parse(_output).toString();
    });
  }

  Widget _buildButton(String buttonText){
    return Expanded(child: ElevatedButton(
      onPressed: ()=>_buttonPressed(buttonText),
      child: Text(buttonText,
        style: TextStyle(fontSize: 28),
      ),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isPortrait=MediaQuery.of(context).orientation==Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator App"),
      ),
      body:Column(
        children:<Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24,horizontal: 12),
            child: Text(
              _output,
              style: TextStyle(fontSize: 48,fontWeight: FontWeight.bold),
            ),
          ),
         Expanded(child: Divider(),
         ),
          isPortrait ? _buildPortraitLayout(): _buildLandscapeLayout(),
        ],
      ),
    );
  }

  Widget _buildPortraitLayout(){
    return Column(
      children: <Widget>[
        _buildRow(["7","8","9","/"]),
        _buildRow(["4","5","6","*"]),
        _buildRow(["1","2","3","-"]),
        _buildRow(["C","0","=","+"]),
      ],
    );
  }

  Widget _buildLandscapeLayout(){
    return Row(
      children: <Widget>[
        Expanded(child: Column(
          children: <Widget>[
            _buildRow(["7","8","9"]),
            _buildRow(["4","5","6"]),
            _buildRow(["1","2","3"]),
            _buildRow(["C","0","="]),
          ],
        ),
    ),

    Expanded(child: Column(children: <Widget>[
      _buildButton("/"),
      _buildButton("*"),
      _buildButton("-"),
      _buildButton("+"),
    ],
    ),
    ),
      ],
    );
  }

  Widget _buildRow(List<String> buttonTexts){
    return Expanded(child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: buttonTexts.map((buttonText)=> _buildButton(buttonText)).toList(),
    ),
    );
  }
}
