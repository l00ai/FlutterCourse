import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

void main() => runApp(
    MaterialApp(
      title: "Tutorial",
      home: MyPage(),
    ),
);

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SVG"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(),
          SvgPicture.asset(
              "assets/vectors/light.svg",
              semanticsLabel: 'Acme Logo',
            height: 100,
          )
        ],
      ),
    );
  }
}




class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController ageController = TextEditingController();

  late TextEditingController nameController ;

  @override
  void initState() {
    nameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic form"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: nameController,
                enabled: true,
                // obscureText: true,
                keyboardType: TextInputType.text,
                //textInputAction: TextInputAction.newline,
                //maxLines: 4,
                maxLength: 10,
                validator: (value){
                  if(value != null && value.isEmpty){
                    return "Enter user name!";
                  }
                  return null;
                },
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (value) => _formKey.currentState!.validate(),
                decoration: const InputDecoration(
                  labelText: 'UserName',
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                   counterText: "",
                   hintText: "Please enter username ...",
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  //   borderSide: BorderSide(color: Colors.black, width: 2.0),
                  // ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide:
                        BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child: TextFormField(
            //     controller: ageController,
            //     validator: (value) {
            //       if (value!.isEmpty) {
            //         return 'Please enter age';
            //       }
            //       return null;
            //     },
            //     keyboardType: TextInputType.number,
            //     style: TextStyle(
            //       fontSize: 13,
            //     ),
            //     decoration: const InputDecoration(
            //       labelText: 'Age',
            //       hintText: "20",
            //       prefixIcon: Icon(Icons.date_range),
            //       suffixIcon: Icon(
            //         Icons.delete_outline,
            //         color: Colors.red,
            //       ),
            //       enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(20.0)),
            //         borderSide: BorderSide(color: Colors.black, width: 2.0),
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(20.0)),
            //         borderSide: BorderSide(color: Colors.blue, width: 2.0),
            //       ),
            //       errorBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(20.0)),
            //         borderSide: BorderSide(color: Colors.red, width: 2.0),
            //       ),
            //       focusedErrorBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(20.0)),
            //         borderSide:
            //             BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
            //       ),
            //     ),
            //   ),
            // ),
            MaterialButton(
              color: Colors.grey,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  debugPrint("Name is ${nameController.text}");
                  debugPrint("Age is ${ageController.text}");
                }
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
