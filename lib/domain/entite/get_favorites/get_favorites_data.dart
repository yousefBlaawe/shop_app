import 'package:equatable/equatable.dart';

import 'get_favorites_data_list.dart';

class GetFavoritesData extends Equatable
{
  final List<GetFavoritesDataList>dataList;
  GetFavoritesData({required this.dataList});

  @override
  // TODO: implement props
  List<Object?> get props => [dataList];

}
// {
// "status": true,
// "message": null,
// "data": {
// "current_page": 1,
// "data": [
// {
// "id": 176736,
// "product": {
// "id": 82,
// "price": 3075.260000000000218278728425502777099609375,
// "old_price": 3075.260000000000218278728425502777099609375,
// "discount": 0,
// "image": "https://student.valuxapps.com/storage/uploads/products/1638734961565J3.11.jpg",
// "name": "Xiaomi Redmi 10 Dual SIM Mobile- 6.53 Inch FHD , 64GB, 4GB RAM, 4G LTE - Carbon Gray",
// "description": "Model name\tXiaomi Redmi 10\r\nWireless carrier\tUnlocked for All Carriers\r\nBrand\tXiaomi\r\nForm factor\tFoldable Screen\r\nMemory storage capacity\t4 GB\r\nOS\tAndroid 11.0\r\nColour\tCarbon Gray\r\nCellular technology\tLTE\r\nSIM card slot count\tDual SIM\r\nModel year\t2021\r\n------------\r\nAbout this item\r\nAI quad camera | 90Hz FHD+ display , 5000mAh battery , Gaming CPU , fast charging\r\nWeight: 181g\r\nHelio G88 processor,Octa-Core ,12nm manufacturing process Dimensions:161.95mm x 75.53mm x 8.92mm\r\nMain camera : 50MP\r\nFront camera : 8MP"
// }
// },
// {
// "id": 176816,
// "product": {
// "id": 53,
// "price": 5599,
// "old_price": 10230,
// "discount": 45,
// "image": "https://student.valuxapps.com/storage/uploads/products/1615440689wYMHV.item_XXL_36330138_142814934.jpeg",
// "name": "JBL Xtreme 2 Portable Waterproof Bluetooth Speaker - Blue JBLXTREME2BLUAM",
// "description": "GENERAL SPECIFICATIONS\r\nMusic playing time: 15 hours\r\nOutput power (W): 2 x 20\r\nDIMENSIONS\r\nDimensions: 13.6 x 28.8 x 13.2 centimeters\r\nWeight: 2.39 kilograms\r\nCONTROL AND CONNECTION SPECIFICATIONS\r\nBluetooth version: 4.2\r\nBATTERY\r\nBattery capacity: 10000 mAh\r\nCharging time: 3.5 hours\r\nFEATURES\r\n3.5 mm audio cable Input: Yes\r\nAuto power off: Yes\r\nBluetooth: Yes\r\nJBL Connect+: Yes\r\nPower bank: Yes\r\nSpeakerphone: Yes\r\nVoice Assistant: Yes\r\nWaterproof: Yes"
// }
// },
// {
// "id": 176818,
// "product": {
// "id": 55,
// "price": 44500,
// "old_price": 44500,
// "discount": 0,
// "image": "https://student.valuxapps.com/storage/uploads/products/1615442168bVx52.item_XXL_36581132_143760083.jpeg",
// "name": "Apple MacBook Pro",
// "description": "Bring home the Apple MacBook Pro and experience computing like never before. This Apple laptop features a powerful 2.3Ghz 8th Gen-Intel Core i5 processor that makes sure the system keeps performing efficiently. Experience smooth and fast multitasking with the 8GB RAM. The Intel Iris Plus Graphics render images in high-quality and make your gaming experience a pleasing one. The macOS operating system offers various user-friendly features. Store your movies, audios, and other important files comfortably on the 512GB SSD of this device. The 13.3inch display allows you to view your favorite movies and other content in high quality. The Retina display features bright LED backlighting and a high contrast ratio that enhances your viewing experience. The True Tone technology provides a natural viewing experience by adjusting the white balance of the screen as per the color temperature of the light around. Featuring well-balanced, high-fidelity sounds, this laptop delivers an immersive audio experience. The Apple T2 chip lets you store your data in an encrypted format with the help of its Secure Enclave coprocessor. Also, it tightens the security further with the help of the Touch ID. The Touch ID only allows you to unlock your laptop using your fingerprints. The Touch Bar controls simplify various activities such as sending an email or formatting a document. This lightweight laptop can be easily carried around in your backpack. It features a space grey that gives it a distinguished and beautiful look."
// }
// }
// ],
// "first_page_url": "https://student.valuxapps.com/api/favorites?page=1",
// "from": 1,
// "last_page": 1,
// "last_page_url": "https://student.valuxapps.com/api/favorites?page=1",
// "next_page_url": null,
// "path": "https://student.valuxapps.com/api/favorites",
// "per_page": 35,
// "prev_page_url": null,
// "to": 3,
// "total": 3
// }
// }