import 'package:balance/models/combined_model.dart';
import 'package:balance/widgets/balance_page_wt/button_custom.dart';
import 'package:flutter/material.dart';

class BSNumKeyboard extends StatefulWidget {
  final CombinedModel combinedModel;
  const BSNumKeyboard({super.key, required this.combinedModel});

  @override
  State<BSNumKeyboard> createState() => _BSNumKeyboardState();
}

class _BSNumKeyboardState extends State<BSNumKeyboard> {
  String importe = '0.00';

  @override
  Widget build(BuildContext context) {
    String Function(Match) mathFunc;
    RegExp reg = RegExp(r'^(0|[1-9][0-9]*)(\.[0-9]{0,2})?$');
    mathFunc = (Match match) => '${match[1]?.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}${match[2] != null ? match[2]?.padRight(3, '') : ''}';
    return GestureDetector(
      onTap: () {
        _numPad();
      },
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            const Text('Cantidad Ingresada:'),
            Text('\$ ${reg.hasMatch(importe) ? importe.replaceAllMapped(reg, mathFunc) : "0.00"}',
            style: const TextStyle(
              fontSize: 30, 
              letterSpacing: 2,
              fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
  _numPad(){
    // ignore: no_leading_underscores_for_local_identifiers
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
        return WillPopScope(
          onWillPop: () async => false,
          child: SizedBox(
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
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Expanded(child: 
                            ButtonCustom(texto: 'Aceptar', color: Colors.green, onTap: () {
                              setState(() {
                                if (importe.isEmpty) {
                                  importe = '0.00';
                                } else if (!RegExp(r'^\d*\.?\d+$').hasMatch(importe)){
                                  importe = '0.00';
                                }
                                Navigator.pop(context);
                                print(importe);
                                widget.combinedModel.amount = double.parse(importe);
                              });
                            }),
                         ),
                        Expanded(child: 
                            ButtonCustom(texto: 'Rechazar', color: Colors.red, onTap: () {
                              setState(() {
                                importe = '0.00';
                                Navigator.pop(context);
                                widget.combinedModel.amount = double.parse(importe);
                              });
                          }),
                        )
                      ]
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}


