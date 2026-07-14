import 'package:sangwari_maa/features/videomodule/data/model/video_module.dart';

abstract class VideoModuleDataSource {
  Future<List<VideoModule>> getVideoModules();
}

class VideoModuleLocalDataSource implements VideoModuleDataSource {
  @override
  Future<List<VideoModule>> getVideoModules() async {
    return const [
      VideoModule(
        id: '1',
        category: VideoCategory.bpcr,
        titleEn: 'Maternal Nutrition: Tips For A Healthy Mother And Child (Hindi) | Project Jagriti | Mamta HIMC',
        titleHi: 'मातृ पोषण: स्वस्थ माँ और बच्चे के लिए सुझाव',
        videoUrl: 'https://www.youtube.com/watch?v=7E4CPO5DhhA',
        thumbnailUrl: 'https://img.youtube.com/vi/7E4CPO5DhhA/hqdefault.jpg',
      ),
      VideoModule(
        id: '2',
        category: VideoCategory.bpcr,
        titleEn: 'Maternal Health',
        titleHi: 'मातृ स्वास्थ्य',
        videoUrl: 'https://youtu.be/K6q3K8SeJ5g?si=S1r1x-FW9w0yg_oO',
        thumbnailUrl: 'https://img.youtube.com/vi/K6q3K8SeJ5g/hqdefault.jpg',
      ),
      VideoModule(
        id: '3',
        category: VideoCategory.pnc,
        titleEn: 'Breastfeeding',
        titleHi: 'स्तनपान',
        videoUrl: 'https://www.youtube.com/watch?v=vOZMYnjyX2I',
        thumbnailUrl: 'https://img.youtube.com/vi/vOZMYnjyX2I/hqdefault.jpg',
      ),
      VideoModule(
        id: '4',
        category: VideoCategory.pnc,
        titleEn: 'Breastfeeding | MPMG',
        titleHi: 'स्तनपान | MPMG',
        videoUrl: 'https://youtu.be/Ir9VPFUccZo?si=0hAZkHN9jB9C-XoH',
        thumbnailUrl: 'https://img.youtube.com/vi/Ir9VPFUccZo/hqdefault.jpg',
      ),
      VideoModule(
        id: '5',
        category: VideoCategory.bpcr,
        titleEn: 'Animatic 2 Importance Of Nutrition | MPMG',
        titleHi: 'एनिमेटिक 2 पोषण का महत्व | MPMG',
        videoUrl: 'https://www.youtube.com/watch?v=tsvAe25TfwE',
        thumbnailUrl: 'https://img.youtube.com/vi/tsvAe25TfwE/hqdefault.jpg',
      ),
    ];
  }
}