import 'package:flutter/material.dart';
import 'package:therafy_app/core/services/storage_service.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String profileName = "Nombre sin configurar";
  String profileEmail = "Correo sin configurar";

  String profileRole = "Psicología";

  final List<String> professions = [
    "Psicología",
    "Terapia Ocupacional",
    "Fonoaudiología",
    "Kinesiología",
    "Trabajo Social",
    "Medicina",
    "Educación",
    "Enfermería",
    "Fisiatría",
    "Ortesista",
    //agregar las profesiones actuales del it o de cada institución
  ];

  String? profileImagePath; //para cambiar el perfil

  //controller para editar nombre
  final TextEditingController nameController = TextEditingController();
  //controller para correo
  final TextEditingController emailController = TextEditingController();

  //método para guardar
  Future<void> saveProfile() async {
    await StorageService.saveString('profile_name', profileName);
    await StorageService.saveString('profile_email', profileEmail);

    await StorageService.saveString('profile_image', profileImagePath ?? '');

    await StorageService.saveString('profile_role', profileRole);
  }

  //para cargar datos del perfil
  Future<void> loadProfile() async {
    profileName =
        StorageService.getString('profile_name') ?? "Nombre sin configurar";

    profileEmail =
        StorageService.getString('profile_email') ?? "Correo sin configurar";

    profileImagePath = StorageService.getString('profile_image');
    if (profileImagePath == '') {
      profileImagePath = null;
    }

    profileRole = StorageService.getString('profile_role') ?? "Psicología";
    if (!professions.contains(profileRole)) {
      profileRole = "Psicología";
    }

    setState(() {});
  }

  //para cambiar la foto de perfil
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    setState(() {
      profileImagePath = image.path;
    });

    saveProfile();
  }

  //metodo para editar el nombre
  void editarNombre() {
    nameController.text = profileName;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Cambiar nombre",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Nombre",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    profileName = nameController.text;
                  });

                  saveProfile(); //para guardar la info
                  Navigator.pop(context);
                },
                child: const Text("Guardar"),
              ),
            ],
          ),
        );
      },
    );
  }

  //para editar el correo
  void editarCorreo() {
    emailController.text = profileEmail;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Cambiar correo",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Correo",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    profileEmail = emailController.text;
                  });

                  saveProfile(); //para guardar la info
                  Navigator.pop(context);
                },
                child: const Text("Guardar"),
              ),
            ],
          ),
        );
      },
    );
  }

  //metodo para editar la profesion
  void editarRol() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Cambiar área de desempeño",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              DropdownButtonFormField<String>(
                value: profileRole,
                decoration: const InputDecoration(
                  labelText: "Área de desempeño",
                  border: OutlineInputBorder(),
                ),
                items: professions.map((profession) {
                  return DropdownMenuItem(
                    value: profession,
                    child: Text(profession),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    profileRole = value!;
                  });
                },
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  saveProfile();
                  Navigator.pop(context);
                },
                child: const Text("Guardar"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text("Perfil"),

        //poder hacer el banner flexible
        //stack para poner sobre una capa(layout) encima de, en este caso la imagen
        flexibleSpace: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset('assets/images/banner3.jpg', fit: BoxFit.cover),
          ],
        ),
        toolbarHeight: 80, //tamaño barra
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),

            //foto perfil
            CircleAvatar(
              radius: 60,
              backgroundImage: profileImagePath != null
                  ? FileImage(File(profileImagePath!))
                  : const AssetImage('assets/images/chicharito_profile.jpeg')
                        as ImageProvider,
            ),

            SizedBox(height: 2),

            Text(
              profileName, //variable nombre
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),

            SizedBox(height: 2),

            Text(
              profileEmail, //variable correo
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),

            SizedBox(height: 2),

            Text(
              profileRole,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 20),

            // Opciones tipo perfil
            ListTile(
              leading: Icon(Icons.photo, color: Colors.white),
              title: Text(
                "Cambiar foto de perfil",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  //PASARLO AL MAIN
                ),
              ),
              trailing: Icon(Icons.arrow_forward, color: Colors.white),
              tileColor: Theme.of(context).colorScheme.primary,
              onTap: pickImage, //funcion cambiar foto de perfil
            ),

            Divider(),

            ListTile(
              leading: Icon(Icons.badge, color: Colors.white),
              title: Text(
                "Cambiar nombre",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              trailing: Icon(Icons.arrow_forward, color: Colors.white),
              tileColor: Theme.of(context).colorScheme.primary,
              onTap: editarNombre,
            ),

            Divider(),

            ListTile(
              leading: const Icon(Icons.email, color: Colors.white),
              title: const Text(
                "Cambiar correo",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              trailing: const Icon(Icons.arrow_forward, color: Colors.white),
              tileColor: Theme.of(context).colorScheme.primary,
              onTap: editarCorreo,
            ),

            Divider(),

            ListTile(
              leading: const Icon(Icons.work, color: Colors.white),
              title: const Text(
                "Cambiar área de desempeño",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              trailing: const Icon(Icons.arrow_forward, color: Colors.white),
              tileColor: Theme.of(context).colorScheme.primary,
              onTap: editarRol,
            ),
          ],
        ),
      ),
    );
  }
}
