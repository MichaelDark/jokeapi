import '../../query_params/dry_run_query_param.dart';
import '../post_joke_api_request.dart';

class SubmitJokeRequest extends PostJokeApiRequest {
  SubmitJokeRequest({
    bool dryRun = false,
  }) : super(
          'submit',
          queryParameters: [
            if (dryRun) DryRunQueryParam(),
          ],
        );
}
