import 'package:flutter/material.dart';

class BSNumKeyboard extends StatefulWidget {
  const BSNumKeyboard({super.key});

  @override
  State<BSNumKeyboard> createState() => _BSNumKeyboardState();
}

class _BSNumKeyboardState extends State<BSNumKeyboard> {
  String importe = '0.00';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _numPad();
      },
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            const Text('Cantidad Ingresada:'),
            Text('\$ $importe',
            style: const TextStyle(
              fontSize: 30, 
              letterSpacing: 2,
              fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }
  _numPad(){
    _num(String _text, double _height){
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){
          setState(() {
            if (importe == '0.00') importe = '';
              importe += _text;
          });
        } ,
        child: SizedBox(
          height: _height,
          child: Center(
            child: Text(_text, style: const TextStyle(
                fontSize: 40,
              ),
            ),
          ),
        ),
      );
    }
    showModalBottomSheet(
      // barrierColor: Colors.transparent,
      // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // isDismissible: false,
      // enableDrag: false,
      
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40)
        )
      ),
      context: context, 
      builder: (BuildContext context){
        return SizedBox(
          height: 500,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints){
                var height = constraints.biggest.height / 5;
                return Column(
                  children: [
                    Table(
                      border: TableBorder.symmetric(
                        inside: const BorderSide(
                          // color: Colors.grey,
                          width: 0.1,
                        )
                      ),
                      children: [
                        TableRow(
                          children:[
                          _num('1',height),
                          _num('2',height),
                          _num('3',height),
                          ]
                        ),
                        TableRow(
                          children:[
                          _num('4',height),
                          _num('5',height),
                          _num('6',height),
                          ]
                        ),
                        TableRow(
                          children:[
                          _num('7',height),
                          _num('8',height),
                          _num('9',height),
                          ]
                        ),
                        TableRow(
                          children:[
                          _num('.',height),
                          _num('0',height),
                          GestureDetector(
                            onLongPress: () {
                              setState(() {
                                importe = '0.00';
                              });
                            },
                            onTap: () {
                              setState(() {
                                if (importe.isNotEmpty){
                                  importe = importe.substring(0,importe.length-1);
                                }
                              });
                            },
                            behavior: HitTestBehavior.opaque,
                            child: SizedBox(
                              height: height,
                              child: const Icon(
                                Icons.backspace,
                                size: 35,
                              ),
                            ),
                          ),
                          ]
                        ),
                      ],
                    )
                  ],
                );
            },
          ),
        );
    },);
  }
}