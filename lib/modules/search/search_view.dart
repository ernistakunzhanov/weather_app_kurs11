import 'dart:developer';

import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});
  TextEditingController _controller = TextEditingController();
  String? text;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Container(
          height: size.height * 1,
          width: size.width * 1,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/scale_1200.webp'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextFormField(
                    // controller: _controller,
                    onChanged: (newValue) {
                      text = newValue;
                      log('onChanged ===> $text ');
                    },
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30),
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Icon(
                          Icons.search,
                          size: 40,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: Ink(
                    color: Colors.blue,
                    child: InkWell(
                      splashColor: Colors.grey,
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        Navigator.pop(context, text);
                        log('control ==> $text');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            // color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'Aba yrayin tap',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
