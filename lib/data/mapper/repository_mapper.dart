import 'package:clean_arch_sample/data/entities/repository_response.dart';
import 'package:clean_arch_sample/data/mapper/base/base_mapper.dart';
import 'package:clean_arch_sample/domain/entities/repository.dart';

class RepositoryMapper implements BaseMapper<RepositoryResponse, Repository> {
  @override
  Repository map(RepositoryResponse argument) {
    return Repository(
      name: argument.name,
    );
  }
}
