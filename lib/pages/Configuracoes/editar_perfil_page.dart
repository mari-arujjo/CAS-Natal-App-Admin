import 'dart:io';
import 'dart:typed_data';
import 'package:cas_natal_app_admin/src/appuser/appuser_model.dart';
import 'package:cas_natal_app_admin/src/appuser/appuser_provider.dart';
import 'package:cas_natal_app_admin/cores.dart';
import 'package:cas_natal_app_admin/widgets/botoes/bt_icon_widget.dart';
import 'package:cas_natal_app_admin/widgets/botoes_padrao/bt_laranja_widget.dart';
import 'package:cas_natal_app_admin/widgets/inputs/input_widget.dart';
import 'package:cas_natal_app_admin/widgets/vizualizacao/carregando_widget.dart';
import 'package:cas_natal_app_admin/widgets/vizualizacao/container_widget.dart';
import 'package:cas_natal_app_admin/widgets/fotos/avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class EditarPerfilPage extends ConsumerStatefulWidget {
  const EditarPerfilPage({super.key});

  @override
  ConsumerState<EditarPerfilPage> createState() => _EditarPerfilPageState();
}

class _EditarPerfilPageState extends ConsumerState<EditarPerfilPage> {
  TextEditingController? nameCtrl;
  TextEditingController? userNameCtrl;
  TextEditingController? emailCtrl;
  TextEditingController? roleCtrl;
  final cores = Cores();

  void _initializeControllers(AppUserModel user) {
    if (nameCtrl == null) {
      nameCtrl = TextEditingController(text: user.fullName);
      userNameCtrl = TextEditingController(text: user.userName);
      emailCtrl = TextEditingController(text: user.email);
      roleCtrl = TextEditingController(text: user.privateRole);
    }
  }
  
  @override
  void dispose() {
    nameCtrl?.dispose();
    userNameCtrl?.dispose();
    emailCtrl?.dispose();
    super.dispose();
  }

  File? img;
  bool changePhoto = false;
  Uint8List? imgBytes;
  final picker = ImagePicker();
  pickImageGallery() async{
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null){
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        img = File(pickedFile.path);
        imgBytes = bytes;
        changePhoto = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final asyncUser = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(title: Text('@mari.arujjo')),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                asyncUser.when(
                  data: (user){
                    _initializeControllers(user!);
                    
                    return Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            AvatarWidget(tam: 60, imgFile: img, imgBytes: imgBytes),
                            BotaoIconWidget(
                              icon: Icon(Icons.edit), 
                              onPressed: () {  
                                pickImageGallery();
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        ContainerWidget(
                          child: Form(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Nome:', style: TextStyle(fontSize: 16)),
                                SizedBox(height: 5),
                                InputPadraoWidget(
                                  maxLength: 50,
                                  readOnly: false,
                                  controller: nameCtrl,
                                ),

                                Text('Usuário:', style: TextStyle(fontSize: 16)),
                                SizedBox(height: 5),
                                InputPadraoWidget(
                                  maxLength: 20,
                                  readOnly: false, 
                                  controller: userNameCtrl,
                                ),

                                Text('Email:', style: TextStyle(fontSize: 16)),
                                SizedBox(height: 5),
                                InputPadraoWidget(
                                  maxLength: 150,
                                  readOnly: false,
                                  controller: emailCtrl,
                                ),

                                Text('Role:', style: TextStyle(fontSize: 16)),
                                SizedBox(height: 5),
                                InputPadraoWidget(
                                  maxLength: 150,
                                  readOnly: true,
                                  controller: roleCtrl,
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BotaoLaranjaWidget(
                              txt: 'Salvar',
                              onPressed: () {},
                              tam: 120,
                            ),
                            SizedBox(width: 20),
                            BotaoLaranjaWidget(
                              txt: 'Cancelar',
                              onPressed: () {},
                              tam: 120,
                            ),
                          ],
                        ),
                      ]
                    );

                  },
                  loading: () => CarregandoWidget(),
                  error:(error, stackTrace) => Text('Erro: $error')
                ),
                
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
