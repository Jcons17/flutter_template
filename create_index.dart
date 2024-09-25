import 'dart:io';

void main() {
  // Define el directorio raíz donde buscar las carpetas
  const String rootDir = 'lib'; // Cambia esto al directorio deseado
  createExportFiles(Directory(rootDir));
}

void createExportFiles(Directory directory) {
  // Obtiene todas las carpetas en el directorio actual
  final List<FileSystemEntity> entities = directory.listSync();
  for (var entity in entities) {
    if (entity is Directory) {
      // Si es una carpeta, crea el archivo con el nombre de la carpeta
      createExportFile(entity);

      // Llama recursivamente a la función para las subcarpetas
      createExportFiles(entity);
    }
  }
}

void createExportFile(Directory directory) {
  final String folderName = directory.uri.pathSegments.elementAt(directory.uri.pathSegments.length - 2);
  final String exportFilePath = '${directory.path}/$folderName.dart';
  final File exportFile = File(exportFilePath);

  final List<String> exports = [];

  // Recorre los archivos en la carpeta
  exports.add("");

  final List<FileSystemEntity> files = directory.listSync();
  for (var file in files) {
    if (file is File &&
        !file.path.contains(".g.") &&
        !file.path.contains(".freezed.") &&
        file.path.endsWith('.dart') &&
        file.path != exportFilePath) {
      // Agrega la línea de exportación para cada archivo Dart
      final String fileName = file.uri.pathSegments.last;
      exports.remove(0);
      exports.add("export '$fileName';");
    }
  }
  // Incluye exportaciones de subcarpetas
  for (var file in files) {
    if (file is Directory) {
      final String subFolderName = file.uri.pathSegments.elementAt(file.uri.pathSegments.length - 2);
      exports.add("export '$subFolderName/$subFolderName.dart';");
    }
  }

  // Escribe el contenido en el archivo con el nombre de la carpeta
  if (exports.isNotEmpty) {
    exportFile.writeAsStringSync(exports.join('\n'));
  } else {}
}
