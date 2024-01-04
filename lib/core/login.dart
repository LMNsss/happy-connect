import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:happy_connect/core/Widget/text.dart';

class Login extends StatefulWidget{
  @override
  _Login creatState() => _Login();


}
class _Login extends State<Login> {
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    _launchURL(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/1-background 2 1.png'),
                // Đường dẫn đến ảnh
                fit: BoxFit
                    .cover, // Căn ảnh để nó phủ hết kích thước của Container
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: screenHeight / 2,
                    alignment: Alignment.center,
                    // child: Text(
                    //   'HAPPY CONNECT',
                    //   style: TextStyle(fontSize: 30, color: Colors.white),
                    //
                    // ),
                    child: SingleTextWidget(
                        text: 'HAPPY CONNECT',
                        textColor: Colors.white,
                        textSize: 30,
                        textWeight: FontWeight.normal),
                  ),
                ),
                // Expanded(
                //   flex: 2,
                Container(
                  // height: screenHeight / 2,
                  padding: EdgeInsets.only(bottom: 10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35.0),
                      topRight: Radius.circular(35.0),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: const Text(
                          'Đăng nhập',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                          'Nhập thông tin chi tiết của bạn bên dưới.',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Container(
                        width: 300,
                        margin: EdgeInsets.only(top: 20),
                        child: TextField(
                          controller: _usernameController() ,
                          decoration: InputDecoration(
                            hintText: 'Username',
                            border: OutlineInputBorder(
                              // Đặt loại đường biên và màu sắc
                              borderRadius: BorderRadius.circular(100.0),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(100, 146, 146, 146),
                                width: 2.0,
                              ),
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      Container(
                        width: 300,
                        margin: const EdgeInsets.only(top: 10),
                        child: TextField(
                          controller: _passwordController(),
                          decoration: InputDecoration(
                            hintText: 'Password',
                            border: OutlineInputBorder(
                              // Đặt loại đường biên và màu sắc
                              borderRadius: BorderRadius.circular(100.0),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(100, 146, 146, 146),
                                width: 2.0,
                              ),
                            ),
                          ),
                          textInputAction: TextInputAction.done,
                          onEditingComplete:(){

                          },
                        ),
                      ),
                      Container(
                        width: 300,
                        height: 65,
                        margin: EdgeInsets.only(top: 20.0),
                        // Đặt margin cho nút 2
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red, // Màu nền của nút
                            onPrimary: Colors.white, // Màu chữ của nút
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Đăng nhập',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Bạn chưa có tài khoản?',
                                style: TextStyle(fontSize: 15),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _launchURL('https://example.com');
                                },
                                child: const Text(
                                  'Đăng ký',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _launchURL('https://example.com');
                        },
                        child: const Text(
                          'Chính sách bảo mật và quyền riêng tư',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // ),
              ],
            )),
      ),
    );
  }
}


