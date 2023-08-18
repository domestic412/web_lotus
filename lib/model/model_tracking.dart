class ContainerTracking {
  List<TrackingContainers>? trackingContainers;
  List<TrackingZims>? trackingZims;

  ContainerTracking({this.trackingContainers, this.trackingZims});

  ContainerTracking.fromJson(Map<String, dynamic> json) {
    if (json['trackingContainers'] != null) {
      trackingContainers = <TrackingContainers>[];
      json['trackingContainers'].forEach((v) {
        trackingContainers!.add(new TrackingContainers.fromJson(v));
      });
    }
    if (json['trackingZims'] != null) {
      trackingZims = <TrackingZims>[];
      json['trackingZims'].forEach((v) {
        trackingZims!.add(new TrackingZims.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.trackingContainers != null) {
      data['trackingContainers'] =
          this.trackingContainers!.map((v) => v.toJson()).toList();
    }
    if (this.trackingZims != null) {
      data['trackingZims'] = this.trackingZims!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TrackingContainers {
  String? bookingNo;
  String? container;
  String? size;

  TrackingContainers({this.bookingNo, this.container, this.size});

  TrackingContainers.fromJson(Map<String, dynamic> json) {
    bookingNo = json['bookingNo'];
    container = json['container'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bookingNo'] = this.bookingNo;
    data['container'] = this.container;
    data['size'] = this.size;
    return data;
  }
}

class TrackingZims {
  String? container;
  String? status;
  String? location;
  String? eventDate;

  TrackingZims({this.container, this.status, this.location, this.eventDate});

  TrackingZims.fromJson(Map<String, dynamic> json) {
    container = json['container'];
    status = json['status'];
    location = json['location'];
    eventDate = json['eventDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['container'] = this.container;
    data['status'] = this.status;
    data['location'] = this.location;
    data['eventDate'] = this.eventDate;
    return data;
  }
}