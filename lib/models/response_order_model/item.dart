import 'package:collection/collection.dart';

import 'product.dart';

class Item {
	int? id;
	int? usersId;
	int? productsId;
	int? transactionsId;
	int? quantity;
	DateTime? createdAt;
	DateTime? updatedAt;
	Product? product;

	Item({
		this.id, 
		this.usersId, 
		this.productsId, 
		this.transactionsId, 
		this.quantity, 
		this.createdAt, 
		this.updatedAt, 
		this.product, 
	});

	factory Item.fromJson(Map<String, dynamic> json) => Item(
				id: json['id'] as int?,
				usersId: json['users_id'] as int?,
				productsId: json['products_id'] as int?,
				transactionsId: json['transactions_id'] as int?,
				quantity: json['quantity'] as int?,
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
				product: json['product'] == null
						? null
						: Product.fromJson(json['product'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'users_id': usersId,
				'products_id': productsId,
				'transactions_id': transactionsId,
				'quantity': quantity,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
				'product': product?.toJson(),
			};

	Item copyWith({
		int? id,
		int? usersId,
		int? productsId,
		int? transactionsId,
		int? quantity,
		DateTime? createdAt,
		DateTime? updatedAt,
		Product? product,
	}) {
		return Item(
			id: id ?? this.id,
			usersId: usersId ?? this.usersId,
			productsId: productsId ?? this.productsId,
			transactionsId: transactionsId ?? this.transactionsId,
			quantity: quantity ?? this.quantity,
			createdAt: createdAt ?? this.createdAt,
			updatedAt: updatedAt ?? this.updatedAt,
			product: product ?? this.product,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Item) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			id.hashCode ^
			usersId.hashCode ^
			productsId.hashCode ^
			transactionsId.hashCode ^
			quantity.hashCode ^
			createdAt.hashCode ^
			updatedAt.hashCode ^
			product.hashCode;
}
