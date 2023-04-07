import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class wlcm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController tex1 = TextEditingController();
    Column cl = Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 0, bottom: 0, right: 0, top: 0),
          child: Text(
            'WElCOME!',
            style: TextStyle(
                fontSize: 45,
                fontFamily: 'Allerta',
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(0, 134, 199, 1)),
          ),
        ),
        const Text(
          'to PortScout Cummunity',
          style: TextStyle(
              fontSize: 26,
              fontFamily: 'inconsolata',
              color: Color.fromRGBO(0, 134, 199, 1)),
        ),
        Padding(
            padding: EdgeInsets.only(left: 15, bottom: 60, right: 20, top: 30),
            child: Image.asset('assets/image/gitlogo.png',
                height: 195, width: 195)),

          Column(
            children: [
              const Text(
                'Enter your GitHub UserName:  ',

                style: TextStyle(
                    fontFamily: 'inconsolata', fontSize: 20.00, color: Colors.white),
              ),
              SizedBox(height: 5,),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  fillColor: Color.fromRGBO(108, 122, 137, 0.3),
                  filled: true,
                  icon: Icon(
                    Icons.add_link,
                    color: Color.fromRGBO(0, 134, 199, 1),
                  ),
                  hintText: 'Enter Link ',
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: 'Link',
                  labelStyle: TextStyle(color: Color.fromRGBO(0, 134, 199, 1)),
                ),
              ),

              SizedBox(height: 20,),

                     ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(height: 45.00, width: 166.00),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'Click Button',
                          style: TextStyle(
                            fontSize: 21.00,
                            fontFamily: 'inconsolata',

                          ),


                        ),

                      ),


                   )
            ],
          ),
        
      ],
    );
    SafeArea con = SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 100, right: 20, left: 20, ),
          child: cl,
        ),
      ),
      // minimum: EdgeInsets.only(left: 20, top: 50, right: 20, bottom: 20),
    );
    // Center cn = Center(child: con);
    return con;
  }
}
