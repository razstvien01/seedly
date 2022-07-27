class UserDetails{
  final String name;
  final String email;
  final String address;
  final int contact_number; 
  
  UserDetails({
    required this.name,
    required this.email,
    required this.address,
    required this.contact_number,
  });
  
  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'address': address,
    'contact_number': contact_number,
  };
  
  static UserDetails fromJson(Map<String, dynamic> json) =>  UserDetails(
    name: json['name'],
    email: json['email'],
    address: json['address'],
    contact_number: json['contact_number'],
  );
}