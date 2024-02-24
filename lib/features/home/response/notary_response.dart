class NotaryResponse {
  int? status;
  List<Leads> leads =[];
  NotaryResponse({this.status});

  NotaryResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['leads'] != null) {
      leads = <Leads>[];
      json['leads'].forEach((v) {
        leads.add(Leads.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['leads'] = leads.map((v) => v.toJson()).toList();
    return data;
  }
}

class Leads {

  String? email;
  String? firstName;
  String? lastName;

  Leads(
      {
        this.email,
        this.firstName,
        this.lastName,
      });

  Leads.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    return data;
  }
}
