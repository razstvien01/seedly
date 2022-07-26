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
    'cotact_number': contact_number,
  };
}