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
  final String folderName = directory.uri.pathSegments.last;
  final String exportFilePath = '${directory.path}/$folderName';
  final File exportFile = File(exportFilePath);

  final List<String> exports = [];

  // Recorre los archivos en la carpeta
  final List<FileSystemEntity> files = directory.listSync();
  for (var file in files) {
    if (file is File && file.path.endsWith('.dart') && file.path != exportFilePath) {
      // Agrega la línea de exportación para cada archivo Dart
      final String fileName = file.uri.pathSegments.last;
      exports.add("export '$fileName';");
    }
  }

  // Escribe el contenido en el archivo con el nombre de la carpeta
  if (exports.isNotEmpty) {
    exportFile.writeAsStringSync(exports.join('\n'));
    print('Archivo creado: ${exportFile.path}');
  } else {
    print('No se encontraron archivos Dart en ${directory.path}.');
  }
}
