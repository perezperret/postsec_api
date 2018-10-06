abstract class ApiAction < Lucky::Action
  private def set_cors_header
    context.response.headers.add "Access-Control-Allow-Origin", "*"
    continue
  end
end
