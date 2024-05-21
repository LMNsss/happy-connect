import 'package:flutter/material.dart';
import 'package:happy_connect/core/components/text.dart';
import 'package:happy_connect/core/view/login.dart';

class SamplePhoto extends StatefulWidget {
  const SamplePhoto({super.key});

  @override
  State<SamplePhoto> createState() => _SamplePhoto();
}

class _SamplePhoto extends State<SamplePhoto> {
  // void _logout() {
  //   final AuthService authService = AuthService();
  //   authService.logout();
  //   print('token: ${authService.getToken()}');
  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (context) => Login()));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/NavigationBar.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 12),
                  child: const Text(
                    'Happy Connect',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: const Color.fromARGB(100, 143, 187, 255),
                borderRadius: BorderRadius.circular(6.0)),
            child: IntrinsicWidth(
              child: Center(
                child: Row(
                  children: [
                    const Icon(Icons.warning,
                        color: Color.fromARGB(255, 13, 110, 253)),
                    SingleTextWidget(
                      text:
                          'Chọn ảnh bên dưới để thay đổi ảnh mẫu của bạn nhé!',
                      textColor: const Color.fromARGB(255, 13, 110, 253),
                      textSize: 14,
                      textWeight: FontWeight.normal,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 20),
            alignment: Alignment.centerLeft,
            child: SingleTextWidget(
                textWeight: FontWeight.normal,
                text: 'Chọn ảnh mẫu',
                textColor: Colors.black,
                textSize: 20),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                ),
                itemCount: 8,
                itemBuilder: (context, index) {
                  // Kiểm tra xem item có phải là item đầu tiên hay không
                  bool isFirstItem = index == 0;
                  // Đặt màu sắc dựa trên điều kiện
                  Color itemColor = isFirstItem ? Colors.red : Colors.blue;

                  return Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: itemColor,
                    ),
                    // Các nội dung bên trong item
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
