import 'package:flutter_scale/models/plc_machine_model.dart';
import 'package:flutter_scale/utils/constant.dart';
import 'package:http/http.dart' as http;

class MachineAPI {

  // สร้าง header เพื่อกำหนด format ของข้อมูลที่จะส่งไปยัง API
  _setHeaders() => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  // อ่านข้อมูลเครื่องจักรจาก API
  Future<List<PlcMachineModel>> getAllMachine() async {
    final response = await http.get(
      Uri.parse('${baseURLAPIPLC}machine.php'),
      headers: _setHeaders(),
    );
    // เช็คว่ามีข้อมูลที่ส่งมาหรือไม่
    if(response.body.isNotEmpty){
      return plcMachineModelFromJson(response.body);
    }else{
      return [];
    }
  }

}