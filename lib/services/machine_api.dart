import 'package:http/http.dart' as http;

class MachineAPI {

  // สร้าง header เพื่อกำหนด format ของข้อมูลที่จะส่งไปยัง API
  _setHeaders() => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

}