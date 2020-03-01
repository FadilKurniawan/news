import 'NewsSource.dart';

class NewsSourceApi {
	String status;
	List<NewsSource> sources;

	NewsSourceApi({this.status, this.sources});

	NewsSourceApi.fromJson(Map<String, dynamic> json) {
		status = json['status'];
		if (json['sources'] != null) {
			sources = new List<NewsSource>();
			json['sources'].forEach((v) { sources.add(new NewsSource.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['status'] = this.status;
		if (this.sources != null) {
      data['sources'] = this.sources.map((v) => v.toJson()).toList();
    }
		return data;
	}
}