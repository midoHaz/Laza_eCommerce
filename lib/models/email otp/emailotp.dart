import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpCode extends StatelessWidget {
  const OtpCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width:77 ,
          height: 98,
          child: TextFormField(
            onSaved: (pin1){},
            decoration:InputDecoration(
              hintText: '0',
            ),
            onChanged: (value){
              if(value.length==1){
                FocusScope.of(context).nextFocus();
              }
            },
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
        SizedBox(
          width:77 ,
          height: 98,
          child: TextFormField(
            onSaved: (pin2){},
            decoration:InputDecoration(
              hintText: '0',
            ),
            onChanged: (value){
              if(value.length==1){
                FocusScope.of(context).nextFocus();
              }
            },
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
        SizedBox(
          width:77 ,
          height: 98,
          child: TextFormField(
            onSaved: (pin3){},
            decoration:InputDecoration(
              hintText: '0',
            ),
            onChanged: (value){
              if(value.length==1){
                FocusScope.of(context).nextFocus();
              }
            },
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
        SizedBox(
          width:77 ,
          height: 98,
          child: TextFormField(
            onSaved: (pin4){},
            decoration:InputDecoration(
              hintText: '0',
            ),
            onChanged: (value){
              if(value.length==1){
                FocusScope.of(context).nextFocus();
              }
            },
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
      ],
    );
  }
}
