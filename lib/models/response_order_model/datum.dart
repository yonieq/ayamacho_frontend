import 'package:collection/collection.dart';

import 'item.dart';

class Datum {
	int? id;
	int? usersId;
	String? address;
	int? totalPrice;
	int? shippingPrice;
	String? status;
	String? payment;
	dynamic deletedAt;
	DateTime? createdAt;
	DateTime? updatedAt;
	List<Item>? items;

	Datum({
		this.id, 
		this.usersId, 
		this.address, 
		this.totalPrice, 
		this.shippingPrice, 
		this.status, 
		this.payment, 
		this.deletedAt, 
		this.createdAt, 
		this.updatedAt, 
		this.items, 
	});

	factory Datum.fromJson(Map<String, dynamic> json) => Datum(
				id: json['id'] as int?,
				usersId: json['users_id'] as int?,
				address: json['address'] as String?,
				totalPrice: json['total_price'] as int?,
				shippingPrice: json['shipping_price'] as int?,
				status: json['status'] as String?,
				payment: json['payment'] as String?,
				deletedAt: json['deleted_at'] as dynamic,
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
				items: (json['items'] as List<dynamic>?)
						?.map((e) => Item.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'users_id': usersId,
				'address': address,
				'total_price': totalPrice,
				'shipping_price': shippingPrice,
				'status': status,
				'payment': payment,
				'deleted_at': deletedAt,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
				'items': items?.map((e) => e.toJson()).toList(),
			};

	Datum copyWith({
		int? id,
		int? usersId,
		String? address,
		int? totalPrice,
		int? shippingPrice,
		String? status,
		String? payment,
		dynamic deletedAt,
		DateTime? createdAt,
		DateTime? updatedAt,
		List<Item>? items,
	}) {
		return Datum(
			id: id ?? this.id,
			usersId: usersId ?? this.usersId,
			address: address ?? this.address,
			totalPrice: totalPrice ?? this.totalPrice,
			shippingPrice: shippingPrice ?? this.shippingPrice,
			status: status ?? this.status,
			payment: payment ?? this.payment,
			deletedAt: deletedAt ?? this.deletedAt,
			createdAt: createdAt ?? this.createdAt,
			updatedAt: updatedAt ?? this.updatedAt,
			items: items ?? this.items,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Datum) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			id.hashCode ^
			usersId.hashCode ^
			address.hashCode ^
			totalPrice.hashCode ^
			shippingPrice.hashCode ^
			status.hashCode ^
			payment.hashCode ^
			deletedAt.hashCode ^
			createdAt.hashCode ^
			updatedAt.hashCode ^
			items.hashCode;
}
