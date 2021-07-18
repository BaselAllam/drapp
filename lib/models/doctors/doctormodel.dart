

class DoctorModel{

  String id;
  String doctorImage;
  String doctorName;
  String location;
  int patient;
  int price;
  String rating;

  DoctorModel(this.id, this.doctorImage, this.doctorName, this.location, this.patient, this.price, this.rating);

  factory DoctorModel.fromJson(Map<String, dynamic> i, String id) {
    return DoctorModel(
      id,
      i['doctorImage'],
      i['doctorName'],
      i['location'],
      i['patient'],
      i['price'],
      i['rating']
    );
  }
}