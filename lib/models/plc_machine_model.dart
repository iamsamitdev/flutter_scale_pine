import 'dart:convert';

List<PlcMachineModel> plcMachineModelFromJson(String str) => List<PlcMachineModel>.from(json.decode(str).map((x) => PlcMachineModel.fromJson(x)));

String plcMachineModelToJson(List<PlcMachineModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PlcMachineModel {
    int? id;
    String? name;
    String? imageUrl;
    String? location;
    String? status;
    String? maintenanceStatus;
    DateTime? lastMaintenanceDate;
    OtherDetails? otherDetails;

    PlcMachineModel({
        this.id,
        this.name,
        this.imageUrl,
        this.location,
        this.status,
        this.maintenanceStatus,
        this.lastMaintenanceDate,
        this.otherDetails,
    });

    factory PlcMachineModel.fromJson(Map<String, dynamic> json) => PlcMachineModel(
        id: json["id"],
        name: json["name"],
        imageUrl: json["image_url"],
        location: json["location"],
        status: json["status"],
        maintenanceStatus: json["maintenance_status"],
        lastMaintenanceDate: json["last_maintenance_date"] == null ? null : DateTime.parse(json["last_maintenance_date"]),
        otherDetails: json["other_details"] == null ? null : OtherDetails.fromJson(json["other_details"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_url": imageUrl,
        "location": location,
        "status": status,
        "maintenance_status": maintenanceStatus,
        "last_maintenance_date": "${lastMaintenanceDate!.year.toString().padLeft(4, '0')}-${lastMaintenanceDate!.month.toString().padLeft(2, '0')}-${lastMaintenanceDate!.day.toString().padLeft(2, '0')}",
        "other_details": otherDetails?.toJson(),
    };
}

class OtherDetails {
    String? purple;
    String? otherDetails;
    int? empty;

    OtherDetails({
        this.purple,
        this.otherDetails,
        this.empty,
    });

    factory OtherDetails.fromJson(Map<String, dynamic> json) => OtherDetails(
        purple: json["รุ่น"],
        otherDetails: json["ผู้ผลิต"],
        empty: json["ปีที่ผลิต"],
    );

    Map<String, dynamic> toJson() => {
        "รุ่น": purple,
        "ผู้ผลิต": otherDetails,
        "ปีที่ผลิต": empty,
    };
}
